import 'dart:async';

import 'package:e_medfile/core/routes.enum.dart';
import 'package:e_medfile/features/auth/services/auth_service.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:e_medfile/utils/extensions/text_validation.extension.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController {
  final AuthService _auth;
  OTPVerificationController(this._auth);

  var otp = ''.obs;
  var otpErrorText = ''.obs;
  var otpResendTimer = '00:30'.obs;
  var isResendEnabled = false.obs;
  var isContinueButtonEnabled = false.obs; // Add this variable
  Timer? _timer;
  int _secondsRemaining = 30;
  bool isLogin = false;
  RxBool isVerified = false.obs;

  get secondsRemaining => _secondsRemaining;

  @override
  void onInit() {
    super.onInit();
    startResendTimer();
    isLogin =
        Get.arguments['isLogin'] != null && Get.arguments['isLogin'] == 'true';
    otp.listen((value) {
      validateOtp();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    otpErrorText.value = '';
    otp.value = '';
    otpResendTimer.value = '00:30';
    isResendEnabled.value = false;
    _secondsRemaining = 30;
    super.onClose();
  }

  void startResendTimer() {
    AppLogger.log('startTimer');
    _secondsRemaining = 30;
    isResendEnabled.value = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
        otpResendTimer.value =
            '00:${_secondsRemaining.toString().padLeft(2, '0')}';
      } else {
        _timer?.cancel();
        isResendEnabled.value = true;
      }
    });
  }

  void setOtp(String otp) {
    this.otp.value = otp;
  }

  void validateOtp() {
    if (otp.value.isValidOtp()) {
      otpErrorText.value = '';
      isContinueButtonEnabled.value = true;
    } else {
      otpErrorText.value = 'Please enter a valid OTP';
      isContinueButtonEnabled.value = false;
    }
  }

  void resendOTP() {
    AppLogger.log('resendOTP');
    startResendTimer();
  }

  String getContactInfo() {
    return Get.arguments['phone'] ?? Get.arguments['email'] ?? '';
  }

  void continueToNextScreen() {
    AppLogger.log('OTP: ${otp.value}');
    // Validate OTP
    if (!otp.value.isValidOtp() || !_auth.verifyOtp(contact: getContactInfo(), otp: otp.value)) {
      otpErrorText.value = 'Entered OTP is wrong please enter correct one';
      isContinueButtonEnabled.value = false;
      return;
    }

    // OTP is verified
    isVerified.value = true;
    otpErrorText.value = '';

    final hasEmail = Get.arguments['email'] != null;

    if (isLogin || (!isLogin && hasEmail)) {
      Get.offAllNamed(Routes.dashboard.route);
    } else {
      Get.offAllNamed(Routes.welcomeScreen.route);
    }
  }
}
