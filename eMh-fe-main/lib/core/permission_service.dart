import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show Platform;
import 'package:image_picker/image_picker.dart';

class PermissionService extends GetxController {
  static PermissionService get to => Get.find<PermissionService>();

  Future<bool> requestPermission(Permission permission) async {
    var status = await permission.request();
    return status.isGranted;
  }

  Future<bool> checkPermissionStatus(Permission permission) async {
    var status = await permission.status;
    return status.isGranted;
  }

  Future<bool> requestMultiplePermissions(List<Permission> permissions) async {
    Map<Permission, PermissionStatus> statuses = await permissions.request();
    return statuses.values.every((status) => status.isGranted);
  }

  Future<void> openAppSettings() async {
    await openAppSettings();
  }

  Future<bool> checkAndRequestImagePickerPermission(ImageSource source) async {
    bool hasPermission = false;
    Permission permission;

    if (source == ImageSource.camera) {
      permission = Permission.camera;
    } else if (source == ImageSource.gallery) {
      permission = Platform.isIOS ? Permission.photos : Permission.storage;
      if (Platform.isAndroid) {
        permission = Permission.mediaLibrary;
      }
    } else {
      throw ArgumentError('Unsupported ImageSource');
    }

    hasPermission = await checkPermissionStatus(permission);
    if (!hasPermission) {
      hasPermission = await requestPermission(permission);
    }

    if (!hasPermission) {
      Get.snackbar('Permission Denied',
          'Please grant permission to access ${source == ImageSource.camera ? 'camera' : 'photo gallery'}');
    }

    return hasPermission;
  }
}
