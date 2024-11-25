import 'package:e_medfile/core/routes.enum.dart';
import 'package:e_medfile/features/auth/services/auth_service.dart';
import 'package:e_medfile/utils/extensions/text_validation.extension.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:e_medfile/widgets/bottomsheet/app_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthService _auth;

  LoginController(this._auth);

  final selectedCountryCode = ''.obs;
  final emailOrPhoneController = TextEditingController().obs;
  final emailOrPhoneFocusNode = FocusNode().obs;
  final isLoginButtonEnabled = false.obs;
  final emailOrPhoneErrorText = RxnString(); // Use RxnString for nullable observable

  @override
  void onInit() {
    super.onInit();
    emailOrPhoneController.value.addListener(onEmailOrPhoneFieldChanged);
  }

  @override
  void onClose() {
    emailOrPhoneController.value.removeListener(onEmailOrPhoneFieldChanged);
    emailOrPhoneController.value.dispose();
    emailOrPhoneFocusNode.value.dispose();
    super.onClose();
  }

  void onEmailOrPhoneFieldChanged() {
    final text = emailOrPhoneController.value.text;
    if (text.isEmpty) {
      emailOrPhoneErrorText.value = null; // Clear error text if input is empty
      isLoginButtonEnabled.value = false;
    } else if (text.isValidEmail()) {
      emailOrPhoneErrorText.value = null; // Clear error text if valid email
      isLoginButtonEnabled.value = true;
    } else if (text.isValidPhoneNumber() && text.length <= 10) {
      emailOrPhoneErrorText.value = null; // Clear error text if valid phone number
      isLoginButtonEnabled.value = true;
    } else {
      emailOrPhoneErrorText.value = 'Please enter a valid email or phone number';
      isLoginButtonEnabled.value = false;
    }
  }

  void openLanguageBottonSheet() {
    Get.bottomSheet(
      AppBottomSheet(
        child: Column(
          children: [
            Text('Choose Your Preferred Language',
                style: Get.theme.textTheme.displayMedium),
          ],
        ),
      ),
    );
  }

  changeCountryCode(String countryCode) {
    selectedCountryCode.value = countryCode;
  }

  unfocusEmailOrPhoneField() {
    emailOrPhoneFocusNode.value.unfocus();
  }

  login() {
    if (emailOrPhoneController.value.text.isValidEmail()) {
      AppLogger.log('Logging in with email');
      final email = emailOrPhoneController.value.text;
      Get.toNamed(Routes.otpVerification.route, arguments: {'email': email, 'isLogin': 'true'});
      
      // login with email
      // _auth.loginWithEmail(emailOrPhoneController.value.text);
    } else if (emailOrPhoneController.value.text.isValidPhoneNumber()) {
      AppLogger.log('Logging in with phone number');
      final phone = emailOrPhoneController.value.text;
      Get.toNamed(Routes.otpVerification.route, arguments: {'phone': phone, 'isLogin': 'true'});

      // login with phone number
      // _auth.loginWithPhone(emailOrPhoneController.value.text);
    }
  }
}
