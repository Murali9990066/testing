import 'package:e_medfile/core/routes.enum.dart';
import 'package:e_medfile/features/auth/services/auth_service.dart';
import 'package:e_medfile/features/country_code_picker/country_code_picker_controller.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:e_medfile/utils/extensions/text_validation.extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final AuthService _auth;

  SignupController(this._auth);

  final selectedCountryCode = ''.obs;
  final phoneController = TextEditingController().obs;
  final phoneFocusNode = FocusNode().obs;
  final countryCodeController = CountryCodePickerController().obs;
  final isContinueButtonEnabled = false.obs;
  final phoneErrorText = RxnString(); // Use RxnString for nullable observable

  @override
  void onInit() {
    super.onInit();
    phoneController.value.addListener(validatePhoneNumber); // Add listener for validation

  }

  @override
  void onClose() {
    phoneController.value.removeListener(validatePhoneNumber); // Remove listener for validation
    phoneController.value.dispose();
    phoneFocusNode.value.dispose();
    super.onClose();
  }


  void validatePhoneNumber() {
    final phoneText = phoneController.value.text;
    if (phoneText.isEmpty) {
      phoneErrorText.value = null; // Clear error text if input is empty
      isContinueButtonEnabled.value = false;
    } else {
      phoneErrorText.value = phoneText.isValidPhoneNumber() ? null : 'Please enter a valid phone number';
      isContinueButtonEnabled.value = phoneText.isValidPhoneNumber();
    }
  }

  void onPhoneChanged(String value) {
    validatePhoneNumber();
  }

  changeCountryCode(String countryCode) {
    selectedCountryCode.value = countryCode;
  }

  navigateToLogin() {
    Get.toNamed(Routes.login.route);
  }

  continueSignup() {
    // Implement signup logic here
    AppLogger.log('Continue signup with phone: ${phoneController.value.text}');
    final phone = selectedCountryCode.value + phoneController.value.text;
    Get.toNamed(Routes.otpVerification.route, arguments: {'phone': phone});
  }

  unfocusPhoneField() {
    phoneFocusNode.value.unfocus();
  }
}
