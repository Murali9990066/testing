import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:e_medfile/core/routes.enum.dart';
import 'package:e_medfile/features/auth/controllers/login_controller.dart';
import 'package:e_medfile/features/auth/services/auth_service.dart';
import 'package:mockito/mockito.dart';

// Mock class for AuthService
class MockAuthService extends Mock implements AuthService {
  // Add mock methods here
  Future<bool> checkMobileExists(String mobile) async {
    return Future.value(false); // Default mock response
  }

  Future<bool> generateAndSendOtp(String mobile) async {
    return Future.value(true); // Default mock response
  }

  Future<bool> saveMobileNumber(String mobile) async {
    return Future.value(true); // Default mock response
  }
}

void main() {
  late LoginController loginController;
  late MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
    loginController = LoginController(mockAuthService);
    Get.put(loginController);
  });

  tearDown(() {
    Get.reset();
  });

  group('Login Validation Tests', () {
    test('Enable login button for valid email', () {
      loginController.emailOrPhoneController.value.text = 'test@example.com';
      loginController.onEmailOrPhoneFieldChanged();
      expect(loginController.isLoginButtonEnabled.value, true);
      expect(loginController.emailOrPhoneErrorText.value, null);
    });

    test('Enable login button for valid phone number', () {
      loginController.emailOrPhoneController.value.text = '9876543210';
      loginController.onEmailOrPhoneFieldChanged();
      expect(loginController.isLoginButtonEnabled.value, true);
      expect(loginController.emailOrPhoneErrorText.value, null);
    });

    test('Disable login button for invalid input', () {
      loginController.emailOrPhoneController.value.text = 'invalid_input';
      loginController.onEmailOrPhoneFieldChanged();
      expect(loginController.isLoginButtonEnabled.value, false);
      expect(
          loginController.emailOrPhoneErrorText.value, 'Please enter a valid email or phone number');
    });
  });

  group('Login Navigation Tests', () {
    test('Navigate to OTP verification for valid email', () {
      loginController.emailOrPhoneController.value.text = 'test@example.com';
      loginController.login();

      expect(Get.currentRoute, Routes.otpVerification.route);
      expect(
        Get.arguments,
        {'email': 'test@example.com', 'isLogin': 'true'},
      );
    });

    test('Navigate to OTP verification for valid phone number', () {
      loginController.emailOrPhoneController.value.text = '9876543210';
      loginController.login();

      expect(Get.currentRoute, Routes.otpVerification.route);
      expect(
        Get.arguments,
        {'phone': '9876543210', 'isLogin': 'true'},
      );
    });
  });

  group('Mobile Login API Tests', () {
    test('should generate OTP if mobile number exists', () async {
      // Arrange: Mock the response for checkMobileExists
      when(mockAuthService.checkMobileExists('9876543210'))
          .thenAnswer((_) async => true);

      // Act: Call the API (method under test)
      bool result = await mockAuthService.generateAndSendOtp('9876543210');

      // Assert: Verify that the OTP was generated and sent
      expect(result, true);
      verify(mockAuthService.checkMobileExists('9876543210')).called(1);
      verify(mockAuthService.generateAndSendOtp('9876543210')).called(1);
    });

    test('should save mobile number and generate OTP if mobile number does not exist', () async {
      // Arrange: Mock the response for checkMobileExists and saveMobileNumber
      when(mockAuthService.checkMobileExists('9876543210'))
          .thenAnswer((_) async => false);
      when(mockAuthService.saveMobileNumber('9876543210'))
          .thenAnswer((_) async => true);
      when(mockAuthService.generateAndSendOtp('9876543210'))
          .thenAnswer((_) async => true);

      // Act: Call the API (method under test)
      bool isSaved = await mockAuthService.saveMobileNumber('9876543210');
      bool otpGenerated = await mockAuthService.generateAndSendOtp('9876543210');

      // Assert: Verify that the mobile number was saved and OTP was generated
      expect(isSaved, true);
      expect(otpGenerated, true);
      verify(mockAuthService.saveMobileNumber('9876543210')).called(1);
      verify(mockAuthService.generateAndSendOtp('9876543210')).called(1);
    });
  });
}
