import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadImagesScreen extends StatefulWidget {
  const LoadImagesScreen({super.key});

  @override
  State<LoadImagesScreen> createState() => _LoadImagesScreenState();
}

class _LoadImagesScreenState extends State<LoadImagesScreen> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _images = [];

  Future<void> _pickImages() async {
    // Solicitar permiso para el almacenamiento/galería
    final status = await Permission.photos.request();
    if (!mounted) return;

    if (!status.isGranted) {
      // Mostrar mensaje si el permiso no es concedido
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permiso de galería denegado')),
      );
      return;
    }

    try {
      // Permite seleccionar múltiples imágenes (o usa pickImage para una sola)
      final List<XFile> selected = await _picker.pickMultiImage();
      if (!mounted) return;

      if (selected.isNotEmpty) {
        setState(() {
          _images.addAll(selected);
        });
      }
    } catch (e) {
      if (!mounted) return;
      // Manejar errores
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error cargando imágenes: \$e')),
      );
    }
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
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      File(_images[index].path),
                      fit: BoxFit.cover,
                    ),
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
