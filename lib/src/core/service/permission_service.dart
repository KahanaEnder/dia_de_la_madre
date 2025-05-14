import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  final _deviceInfo = DeviceInfoPlugin();

  Future<bool> requestStorage() async {
    if (!Platform.isAndroid) return true;
    final info = await _deviceInfo.androidInfo;
    final sdk = info.version.sdkInt;
    final status = (sdk >= 33)
        ? await Permission.photos.request()
        : await Permission.storage.request();
    return status.isGranted;
  }
}