import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reference_app/src/core/service/image_service.dart';
import 'package:reference_app/src/core/service/permission_service.dart';

class ImageGalleryProvider extends ChangeNotifier {
  final PermissionService _perm;
  final ImageService _imagesvc;
  List<XFile> images = [];
  bool loading = false;
  String? error;

  ImageGalleryProvider(this._perm, this._imagesvc);

  Future<void> initialize() async {
    loading = true;
    notifyListeners();

    try {
      final paths = await _imagesvc.loadPaths();
      images = paths.map((p) => XFile(p)).where((f) => File(f.path).existsSync()).toList();
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }

  Future<void> pickAndSave() async {
    loading = true;
    notifyListeners();

    final hasPerm = await _perm.requestStorage();
    if (!hasPerm) {
      error = 'Permiso denegado';
      loading = false;
      notifyListeners();
      return;
    }

    try {
      final selected = await _imagesvc.pickImages();
      images.addAll(selected);
      final paths = images.map((x) => x.path).toList();
      await _imagesvc.savePaths(paths);
      error = null;
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}