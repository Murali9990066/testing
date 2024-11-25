import 'package:e_medfile/core/routes.enum.dart';
import 'package:e_medfile/features/auth/views/otp_verification_screen.dart';
import 'package:e_medfile/features/dashboard/views/dashboard_screen.dart';
import 'package:e_medfile/features/medical_reports/views/add_reports_screen.dart';
import 'package:e_medfile/features/medical_reports/views/medical_reports_screen.dart';
import 'package:e_medfile/features/medical_reports/views/report_details_screen.dart';
import 'package:e_medfile/features/profile/views/profile_screen.dart';
import 'package:e_medfile/features/settings/settings_screen.dart';
import 'package:e_medfile/features/welcome/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:e_medfile/features/splash/splash_screen.dart';
import 'package:e_medfile/features/auth/views/login_screen.dart';
import 'package:e_medfile/features/auth/views/signup_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.root.route,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.login.route,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.signup.route,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: Routes.otpVerification.route,
      page: () => OTPVerificationScreen(),
    ),
    GetPage(
      name: Routes.welcomeScreen.route,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.dashboard.route,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: Routes.settings.route,
      page: () => SettingsScreen(),
    ),
    GetPage(
      name: Routes.medicalReports.route,
      page: () => MedicalReportsScreen(),
    ),
    GetPage(
      name: Routes.addMedicalReports.route,
      page: () => AddReportsScreen(),
    ),
    GetPage(
      name: Routes.profile.route,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: Routes.reportDetails.route,
      page: () => ReportDetailsScreen(),
    ),
  ];
}
