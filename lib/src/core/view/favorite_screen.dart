// lib/screens/load_images_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reference_app/src/components/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadImagesScreen extends StatefulWidget {
  const LoadImagesScreen({super.key});

  @override
  State<LoadImagesScreen> createState() => _LoadImagesScreenState();
}

class _LoadImagesScreenState extends State<LoadImagesScreen> {
  final ImagePicker _picker = ImagePicker();
  List<File> _images = [];

  @override
  void initState() {
    super.initState();
    _loadSavedImages();
  }

  Future<void> _loadSavedImages() async {
    final prefs = await SharedPreferences.getInstance();
    final paths = prefs.getStringList('saved_image_paths') ?? [];
    if (!mounted) return;

    setState(() {
      _images = paths.map((path) => File(path)).where((f) => f.existsSync()).toList();
    });
  }

  Future<void> _saveImagePaths() async {
    final prefs = await SharedPreferences.getInstance();
    final paths = _images.map((file) => file.path).toList();
    await prefs.setStringList('saved_image_paths', paths);
  }

  Future<void> _pickImages() async {
    // 1. Pedir permiso
    final status = await Permission.photos.request();
    if (!mounted) return;
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sin Permiso')),
      );
      return;
    }

    try {
      // 2. Seleccionar múltiples imágenes
      final List<XFile> selected = await _picker.pickMultiImage();
      if (!mounted) return;

      if (selected.isNotEmpty) {
        final files = selected.map((x) => File(x.path)).toList();
        setState(() {
          _images.addAll(files);
        });
        await _saveImagePaths();
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error cargando imágenes: $e')),
      );
    }
  }

  Future<void> _removeImage(int index) async {
    setState(() {
      _images.removeAt(index);
    });
    await _saveImagePaths();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería'),
      ),
      body: _images.isEmpty
          ? const Center(child: Text('No hay imágenes'))
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _images.length,
              itemBuilder: (context, index) {
                final file = _images[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          file,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                          icon: const Icon(Icons.delete,color: AppColors.primary,),
                          onPressed: () => _removeImage(index),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImages,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
