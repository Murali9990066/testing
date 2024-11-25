import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';

class AppUpdateService extends GetxController {
  var updateInfo = Rxn<AppUpdateInfo>();
  var flexibleUpdateAvailable = false.obs;

  Future<void> checkForUpdate() async {
    try {
      updateInfo.value = await InAppUpdate.checkForUpdate();
    } catch (e) {
      AppLogger.log(e.toString());
      // showSnack(e.toString());
    }
  }
}
