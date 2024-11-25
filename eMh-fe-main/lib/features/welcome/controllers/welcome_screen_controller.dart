import 'package:e_medfile/core/routes.enum.dart';
import 'package:e_medfile/features/welcome/welcome_screen_with_textfield.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:e_medfile/utils/extensions/text_validation.extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreenController extends GetxController {
  // name screen
  late final TextEditingController nameTextFieldController;
  late final FocusNode nameTextFieldFocusNode;
  final nameScreenTitle = 'What\'s Your Name?';
  final nameTextFieldHintText = 'Name';
  final nameScreenButtonText = 'Next';
  final nameScreenTextUnderButton = '';
  final isNameScreenSkippable = false;
  final isNameButtonEnabled = false.obs;

  // email screen
  late final TextEditingController emailTextFieldController;
  late final FocusNode emailTextFieldFocusNode;
  final emailScreenTitle = 'What\'s Your Email Address?';
  final emailTextFieldHintText = 'Email';
  final emailScreenButtonText = 'Verify Email';
  final emailScreenTextUnderButton = 'Enter OTP sent to your Email';
  final isEmailScreenSkippable = true;
  final isEmailButtonEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize any necessary variables or listeners here
    nameTextFieldController = TextEditingController();
    nameTextFieldFocusNode = FocusNode();
    emailTextFieldController = TextEditingController();
    emailTextFieldFocusNode = FocusNode();
  }

  @override
  void onClose() {
    nameTextFieldController.dispose();
    emailTextFieldController.dispose();
    nameTextFieldFocusNode.dispose();
    emailTextFieldFocusNode.dispose();
    super.onClose();
  }

  void onNameTextFieldInputChange(String value) {
    // Handle name text field input changes
    isNameButtonEnabled.value = value.isValidName();
    AppLogger.log('isNameButtonEnabled: ${isNameButtonEnabled.value}');
  }

  void onEmailTextFieldInputChange(String value) {
    // Handle email text field input changes
      isEmailButtonEnabled.value = value.isValidEmail();
    AppLogger.log('isEmailButtonEnabled: ${isEmailButtonEnabled.value}');
  }

  void onNameScreenButtonPressed() {
    AppLogger.log('onNameScreenButtonPressed');
    // Handle button press
    Get.to(
      () => WelcomeScreenWithTextfield(
        textFieldController: emailTextFieldController,
        textFieldFocusNode: emailTextFieldFocusNode,
        title: emailScreenTitle,
        buttonText: emailScreenButtonText,
        hintText: emailTextFieldHintText,
        isButtonEnabled: isEmailButtonEnabled,
        onButtonPressed: onEmailScreenButtonPressed,
        isSkippable: isEmailScreenSkippable,
        onSkipPressed: onSkipPressed,
        onTextfieldInputChange: onEmailTextFieldInputChange,
        textInputType: TextInputType.emailAddress,
        textUnderButton: emailScreenTextUnderButton,
      ),
      preventDuplicates: false,
    );
  }

  void onEmailScreenButtonPressed() {
    // Handle button press
    // Todo: go to dashboard
    Get.toNamed(Routes.otpVerification.route, arguments: {'email': emailTextFieldController.text});
  }

  void onSkipPressed() {
    // Handle skip action
    // Todo: go to dashboard
    Get.offAllNamed(Routes.dashboard.route);
  }
}
