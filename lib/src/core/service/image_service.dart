import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageService {
  final ImagePicker _picker = ImagePicker();
  static const _prefsKey = 'saved_image_paths';

  Future<List<XFile>> pickImages() async {
    final photos = await _picker.pickMultiImage();
    return photos;
  }

  Future<List<String>> loadPaths() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_prefsKey) ?? [];
  }

  Future<void> savePaths(List<String> paths) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, paths);
  }
}