import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

export 'package:permission_handler/permission_handler.dart' show PermissionStatus;

class Permissions {
  Future<PermissionStatus> checkPermission(PermissionsEnum name) async {
    return await _getPermission(name).status;
  }

  Future<PermissionStatus> request(PermissionsEnum name) async {
    return await _getPermission(name).request();
  }

  Future<bool> openSetting() async {
    return await openAppSettings();
  }

  Permission _getPermission(PermissionsEnum name) {
    switch (name) {
      case PermissionsEnum.camera:
        return Permission.camera;
      case PermissionsEnum.photos:
        if (Platform.isIOS) {
          return Permission.photos;
        } else {
          return Permission.storage;
        }
      case PermissionsEnum.location:
        return Permission.location;
    }
  }
}

enum PermissionsEnum {
  camera,
  photos,
  location,
}
