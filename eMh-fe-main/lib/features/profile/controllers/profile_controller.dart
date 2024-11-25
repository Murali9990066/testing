import 'dart:io';

import 'package:e_medfile/features/profile/services/profile_service.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:e_medfile/utils/enums/diet_type.enum.dart';
import 'package:e_medfile/utils/enums/gender.enum.dart';
import 'package:e_medfile/utils/enums/marital_status.enum.dart';
import 'package:e_medfile/widgets/bottomsheet/app_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService;
  ProfileController(this._profileService);

  final selectedProfileImage = Rxn<File>();

  final isEditingEnabled = false.obs;

  final selectedGender = Rxn<GenderType>();
  final selectedMaritalStatus = Rxn<MaritalStatus>();
  final selectedDiet = Rxn<DietType>();
  final selectedDateOfBirth = Rxn<DateTime>();

  // TextEditingControllers
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController contactNumberController;
  late TextEditingController genderController;
  late TextEditingController ageController;
  late TextEditingController dateOfBirthController;
  late TextEditingController maritalStatusController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController dietController;

  // FocusNodes
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode contactNumberFocusNode;
  late FocusNode genderFocusNode;
  late FocusNode ageFocusNode;
  late FocusNode dateOfBirthFocusNode;
  late FocusNode maritalStatusFocusNode;
  late FocusNode heightFocusNode;
  late FocusNode weightFocusNode;
  late FocusNode dietFocusNode;

  // Enabled flags as RxBool
  final isNameEnabled = false.obs;
  final isEmailEnabled = false.obs;
  final isContactNumberEnabled = false.obs;
  final isGenderEnabled = false.obs;
  final isAgeEnabled = false.obs;
  final isDateOfBirthEnabled = false.obs;
  final isMaritalStatusEnabled = false.obs;
  final isHeightEnabled = false.obs;
  final isWeightEnabled = false.obs;
  final isDietEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
    _initializeFocusNodes();
    _initializeValues();
    selectedProfileImage.value = File(profileImage);
  }

  void _initializeControllers() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    contactNumberController = TextEditingController();
    genderController = TextEditingController();
    ageController = TextEditingController();
    dateOfBirthController = TextEditingController();
    maritalStatusController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();
    dietController = TextEditingController();
  }

  void _initializeFocusNodes() {
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    contactNumberFocusNode = FocusNode();
    genderFocusNode = FocusNode();
    ageFocusNode = FocusNode();
    dateOfBirthFocusNode = FocusNode();
    maritalStatusFocusNode = FocusNode();
    heightFocusNode = FocusNode();
    weightFocusNode = FocusNode();
    dietFocusNode = FocusNode();
  }

  void _initializeValues() {
    selectedProfileImage.value = File(profileImage);
    nameController.text = _profileService.getUserName();
    emailController.text = _profileService.getUserEmail();
    contactNumberController.text = _profileService.getUserContactNumber();
    genderController.text =
        _profileService.getSelectedGender()?.name.capitalize ?? '';
    maritalStatusController.text =
        _profileService.getSelectedMaritalStatus()?.name.capitalize ?? '';
    ageController.text = _profileService.getUserAge().toString();
    heightController.text = _profileService.getUserHeight().toString();
    weightController.text = _profileService.getUserWeight().toString();
    dietController.text =
        _profileService.getSelectedDiet()?.name.capitalize ?? '';
    selectedDateOfBirth.value = _profileService.getUserDateOfBirth();

    dateOfBirthController.text = selectedDateOfBirth.value != null
        ? DateFormat('dd/MM/yyyy').format(selectedDateOfBirth.value!)
        : '';
  }

  @override
  void onClose() {
    _disposeControllers();
    _disposeFocusNodes();
    super.onClose();
  }

  void _disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    contactNumberController.dispose();
    genderController.dispose();
    ageController.dispose();
    dateOfBirthController.dispose();
    maritalStatusController.dispose();
    heightController.dispose();
    weightController.dispose();
    dietController.dispose();
  }

  void _disposeFocusNodes() {
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    contactNumberFocusNode.dispose();
    genderFocusNode.dispose();
    ageFocusNode.dispose();
    dateOfBirthFocusNode.dispose();
    maritalStatusFocusNode.dispose();
    heightFocusNode.dispose();
    weightFocusNode.dispose();
    dietFocusNode.dispose();
  }

  // Methods to toggle individual fields
  void toggleNameEnabled() => isNameEnabled.toggle();
  void toggleEmailEnabled() => isEmailEnabled.toggle();
  void toggleContactNumberEnabled() => isContactNumberEnabled.toggle();
  void toggleGenderEnabled() => isGenderEnabled.toggle();
  void toggleAgeEnabled() => isAgeEnabled.toggle();
  void toggleDateOfBirthEnabled() => isDateOfBirthEnabled.toggle();
  void toggleMaritalStatusEnabled() => isMaritalStatusEnabled.toggle();
  void toggleHeightEnabled() => isHeightEnabled.toggle();
  void toggleWeightEnabled() => isWeightEnabled.toggle();
  void toggleDietEnabled() => isDietEnabled.toggle();

  // Method to toggle all fields
  void toggleAllFields(bool enabled) {
    isNameEnabled.value = enabled;
    isEmailEnabled.value = enabled;
    isContactNumberEnabled.value = enabled;
    isGenderEnabled.value = enabled;
    isAgeEnabled.value = enabled;
    isDateOfBirthEnabled.value = enabled;
    isMaritalStatusEnabled.value = enabled;
    isHeightEnabled.value = enabled;
    isWeightEnabled.value = enabled;
    isDietEnabled.value = enabled;
  }

  void editProfile() {
    isEditingEnabled.value = true;
    toggleAllFields(true);
  }

  void saveProfile() {
    isEditingEnabled.value = false;
    toggleAllFields(false);
    _profileService.setUserProfileImage(selectedProfileImage.value?.path ?? '');
    _profileService.setUserName(nameController.text);
    _profileService.setUserEmail(emailController.text);
    _profileService.setUserContactNumber(contactNumberController.text);
    _profileService.setSelectedGender(selectedGender.value);
    _profileService.setSelectedMaritalStatus(selectedMaritalStatus.value);
    _profileService.setUserAge(ageController.text);
    _profileService.setUserDateOfBirth(selectedDateOfBirth.value);
    _profileService.setUserHeight(heightController.text);
    _profileService.setUserWeight(weightController.text);
    _profileService.setSelectedDiet(selectedDiet.value);
  }

  // select gender
  void selectGender() async {
    AppLogger.log('Selecting gender');
    await AppBottomSheet.showSelectionBottomSheet<GenderType>(
      title: 'Gender',
      options: GenderType.values,
      initialValue: _profileService.getSelectedGender(),
      displayName: (gender) => gender.name.capitalize!,
      onBottomSheetClosed: (value) {
        genderFocusNode.unfocus();
      },
      onDonePressed: (result) {
        var gender = result as GenderType;
        AppLogger.log('On done pressed ${gender.toString()}');
        selectedGender.value = gender;
        genderController.text =
            gender.name.capitalize!; // Set the returned value
        genderFocusNode.unfocus(); // Toggle focus to false

        // save the value in local storage
        // _profileService.setSelectedGender(gender);
      },
    );
    AppLogger.log('Selected gender: ${_profileService.getSelectedGender()}');
  }

  // select marital status
  void selectMaritalStatus() async {
    AppLogger.log('Selecting marital status');
    await AppBottomSheet.showSelectionBottomSheet<MaritalStatus>(
      title: 'Marital Status',
      options: MaritalStatus.values,
      initialValue: _profileService.getSelectedMaritalStatus(),
      displayName: (maritalStatus) => maritalStatus.name.capitalize!,
      onBottomSheetClosed: (value) {
        maritalStatusFocusNode.unfocus();
      },
      onDonePressed: (result) {
        var maritalStatus = result as MaritalStatus;
        AppLogger.log('On done pressed ${maritalStatus.toString()}');
        selectedMaritalStatus.value = maritalStatus;
        maritalStatusController.text =
            maritalStatus.name.capitalize!; // Set the returned value
        maritalStatusFocusNode.unfocus(); // Toggle focus to false

        // save the value in local storage
        // _profileService.setSelectedMaritalStatus(maritalStatus);
      },
    );
  }

  // select date of birth
  void selectDateOfBirth() async {
    AppLogger.log('Selecting date of birth');
    await AppBottomSheet.showDatePickerBottomSheet(
      title: 'Date of Birth',
      onDonePressed: (date) {
        selectedDateOfBirth.value = date;
        dateOfBirthController.text = DateFormat('dd/MM/yyyy').format(date!);
        dateOfBirthFocusNode.unfocus();
      },
      onBottomSheetClosed: (date) => dateOfBirthFocusNode.unfocus(),
      selectedDay: selectedDateOfBirth.value,
    );
  }

  // select diet
  void selectDiet() async {
    AppLogger.log('Diet');
    await AppBottomSheet.showSelectionBottomSheet<DietType>(
      title: 'Diet',
      subtitle: 'What does your diet mainly consist of?',
      options: DietType.values,
      initialValue: _profileService.getSelectedDiet(),
      displayName: (diet) => diet.name.capitalize!,
      onBottomSheetClosed: (value) {
        dietFocusNode.unfocus();
      },
      onDonePressed: (result) {
        var diet = result as DietType;
        AppLogger.log('On done pressed ${result.toString()}');
        selectedDiet.value = diet;
        dietController.text = diet.name.capitalize!;
        dietFocusNode.unfocus();

        // save the value in local storage
        // _profileService.setSelectedDiet(diet);
      },
    );
  }

  // select profile image
  void selectProfileImage() async {
    AppLogger.log('Selecting profile image');
    await AppBottomSheet.showFilePickerBottomSheet(
      onFilePicked: (file) => selectedProfileImage.value = file,
    );
  }

  String get profileImage => _profileService.getUserProfileImage();
}
