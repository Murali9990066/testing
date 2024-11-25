import 'package:e_medfile/core/app_update_service.dart';
import 'package:e_medfile/core/permission_service.dart';
import 'package:e_medfile/features/auth/controllers/login_controller.dart';
import 'package:e_medfile/features/auth/controllers/otp_verification_controller.dart';
import 'package:e_medfile/features/auth/controllers/signup_controller.dart';
import 'package:e_medfile/features/auth/services/auth_service.dart';
import 'package:e_medfile/features/country_code_picker/country_code_picker_controller.dart';
import 'package:e_medfile/features/dashboard/controllers/dashboard_controller.dart';
import 'package:e_medfile/features/language/language_controller.dart';
import 'package:e_medfile/features/local_storage/local_storage.dart';
import 'package:e_medfile/features/medical_reports/controllers/add_medical_report_controller.dart';
import 'package:e_medfile/features/medical_reports/controllers/medical_reports_controller.dart';
import 'package:e_medfile/features/medical_reports/controllers/report_details_controller.dart';
import 'package:e_medfile/features/profile/controllers/profile_controller.dart';
import 'package:e_medfile/features/profile/services/profile_service.dart';
import 'package:e_medfile/features/settings/settings_controller.dart';
import 'package:e_medfile/features/welcome/controllers/welcome_screen_controller.dart';
import 'package:get/get.dart';

class Dependencies {
  static Future<void> init() async {
    // local storage
    final localStorage = LocalStorage();
    await localStorage.init();
    Get.put(localStorage);

    // services
    Get.lazyPut(() => AppUpdateService(), fenix: true);
    Get.lazyPut(() => PermissionService(), fenix: true);
    Get.lazyPut(() => AuthService(Get.find<LocalStorage>()), fenix: true);
    Get.lazyPut(() => ProfileService(Get.find<LocalStorage>()), fenix: true);

    // controllers
    // Get.lazyPut(() => OTPInputController(), fenix: true);
    Get.lazyPut(() => OTPVerificationController(Get.find<AuthService>()),
        fenix: true);
    Get.lazyPut(() => LanguageController(Get.find<AuthService>()), fenix: true);
    Get.lazyPut(() => CountryCodePickerController(), fenix: true);
    Get.lazyPut(() => LoginController(Get.find<AuthService>()), fenix: true);
    Get.lazyPut(() => SignupController(Get.find<AuthService>()), fenix: true);
    Get.put(WelcomeScreenController(), permanent: true);
    Get.lazyPut(() => DashboardController(Get.find<ProfileService>()),
        fenix: true);
    Get.lazyPut(() => SettingsController(Get.find<AuthService>()), fenix: true);
    Get.lazyPut(() => MedicalReportsController(Get.find<ProfileService>()),
        fenix: true);
    Get.lazyPut(() => AddMedicalReportController(Get.find<ProfileService>()),
        fenix: true);
    Get.lazyPut(() => ProfileController(Get.find<ProfileService>()),
        fenix: true);
    Get.lazyPut(() => ReportDetailsController(), fenix: true);
  }
}
