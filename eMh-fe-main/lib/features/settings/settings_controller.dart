import 'package:e_medfile/core/routes.enum.dart';
import 'package:e_medfile/features/auth/services/auth_service.dart';
import 'package:e_medfile/features/settings/setting_item.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:e_medfile/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final AuthService _authService;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  SettingsController(this._authService);

  List<SettingItem> settingItems = [];

  @override
  void onInit() {
    super.onInit();
    settingItems = [
      SettingItem(
        title: 'Logout',
        icon: Icons.logout_rounded,
        onTap: () => logout(),
      ),
      SettingItem(
        title: 'Delete Account',
        icon: Icons.delete_rounded,
        onTap: () => deleteAccount(),
      ),
    ];
  }

  void logout() {
    // display logout dialog
    AppDialog.showLogoutDialog(onLogoutPressed: () {
      // Get.back();
      // AppLogger.log('logout pressed');
      // _authService.logout();
      Get.offAllNamed(Routes.login.route);
    });
  }

  void deleteAccount() {
    // display delete account dialog
    AppDialog.showDeleteAccountDialog(onDeletePressed: () {
      // Get.back();
      // AppLogger.log('delete account pressed');
      // _authService.deleteAccount();
      Get.offAllNamed(Routes.login.route);
    });
  }
}
