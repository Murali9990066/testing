import 'package:e_medfile/features/profile/services/profile_service.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:e_medfile/utils/enums/diet_type.enum.dart';
import 'package:e_medfile/utils/enums/gender.enum.dart';
import 'package:e_medfile/utils/enums/marital_status.enum.dart';
import 'package:e_medfile/utils/extensions/enum.extension.dart';
import 'package:e_medfile/widgets/bottomsheet/app_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  final ProfileService _profileService;
  DashboardController(this._profileService);

  // Observable variables
  final RxString userName = ''.obs;
  final RxInt notificationCount = 0.obs;

  // handle drawer
  final scaffoldKey = GlobalKey<ScaffoldState>();

  /* ------------------------ */
  // personal tab view

  final Rxn<GenderType> selectedGender = Rxn();
  final Rxn<MaritalStatus> selectedMaritalStatus = Rxn();
  final Rxn<DietType> selectedDiet = Rxn();
  final Rxn<DateTime> selectedDateOfBirth = Rxn();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactNumberController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final maritalStatusController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final dietController = TextEditingController();

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final contactNumberFocusNode = FocusNode();
  final genderFocusNode = FocusNode();
  final ageFocusNode = FocusNode();
  final dateOfBirthFocusNode = FocusNode();
  final maritalStatusFocusNode = FocusNode();
  final heightFocusNode = FocusNode();
  final weightFocusNode = FocusNode();
  final dietFocusNode = FocusNode();

  RxBool isPersonalTabViewFieldsEnabled = false.obs;

  // select gender// select gender
  void selectGender() async {
    AppLogger.log('Selecting gender');
    await AppBottomSheet.showSelectionBottomSheet<GenderType>(
      title: 'Gender',
      options: GenderType.values,
      initialValue: selectedGender.value,
      displayName: (gender) => gender.cpName,
      onBottomSheetClosed: (value) {
        genderFocusNode.unfocus();
      },
      onDonePressed: (result) {
        var gender = result as GenderType;
        AppLogger.log('On done pressed ${gender.toString()}');
        selectedGender.value = gender;
        genderController.text = gender.cpName; // Set the returned value
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
      initialValue: selectedMaritalStatus.value,
      displayName: (maritalStatus) => maritalStatus.cpName,
      onBottomSheetClosed: (value) {
        maritalStatusFocusNode.unfocus();
      },
      onDonePressed: (result) {
        var maritalStatus = result as MaritalStatus;
        AppLogger.log('On done pressed ${maritalStatus.toString()}');
        selectedMaritalStatus.value = maritalStatus;
        maritalStatusController.text =
            maritalStatus.cpName; // Set the returned value
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
      onDonePressed: (date) => dateOfBirthController.text = date.toString(),
      onBottomSheetClosed: (date) {
        dateOfBirthFocusNode.unfocus();
      },
    );
  }

  // select diet
  void selectDiet() async {
    AppLogger.log('Diet');
    await AppBottomSheet.showSelectionBottomSheet<DietType>(
      title: 'Diet',
      subtitle: 'What does your diet mainly consist of?',
      options: DietType.values,
      initialValue: selectedDiet.value,
      displayName: (diet) => diet.cpName,
      onBottomSheetClosed: (value) {
        dietFocusNode.unfocus();
      },
      onDonePressed: (result) {
        var diet = result as DietType;
        AppLogger.log('On done pressed ${result.toString()}');
        selectedDiet.value = diet;
        dietController.text = diet.cpName;
        dietFocusNode.unfocus();

        // save the value in local storage
        // _profileService.setSelectedDiet(diet);
      },
    );
  }

  /* ------------------------ */

  @override
  void onInit() {
    super.onInit();
    // Initialize data or fetch from API
    fetchUserData();
    fetchPersonalData();
    fetchMedicalData();
    fetchFamilyData();
  }

  // Method to fetch user data
  void fetchUserData() {
    // TODO: Implement API call to fetch user data
    // For now, we'll use a placeholder
    userName.value = 'John Doe';
  }

  void fetchPersonalData() {
    // TODO: Implement API call to fetch personal data
    // For now, we'll use a placeholder
    nameController.text = _profileService.getUserName();
    emailController.text = _profileService.getUserEmail();
    contactNumberController.text = _profileService.getUserContactNumber();
    genderController.text =
        _profileService.getSelectedGender()?.name.capitalize ?? '';
    ageController.text = _profileService.getUserAge().toString();
    maritalStatusController.text =
        _profileService.getSelectedMaritalStatus()?.name.capitalize ?? '';
    heightController.text = _profileService.getUserHeight().toString();
    weightController.text = _profileService.getUserWeight().toString();
    dietController.text =
        _profileService.getSelectedDiet()?.name.capitalize ?? '';

    selectedDateOfBirth.value = _profileService.getUserDateOfBirth();
    dateOfBirthController.text = selectedDateOfBirth.value != null
        ? DateFormat('dd/MM/yyyy').format(selectedDateOfBirth.value!)
        : '';

    selectedGender.value = GenderType.male;
    selectedMaritalStatus.value = MaritalStatus.single;
    selectedDiet.value = DietType.vegetarian;
  }

  void fetchMedicalData() {
    // TODO: Implement API call to fetch medical data
    // For now, we'll use a placeholder
  }

  void fetchFamilyData() {
    // TODO: Implement API call to fetch family data
    // For now, we'll use a placeholder
  }

  // Method to refresh dashboard data
  void refreshDashboard() {
    fetchUserData();
    fetchPersonalData();
    fetchMedicalData();
    fetchFamilyData();
  }

  // toggle drawer
  void toggleDrawer() {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      AppLogger.log('Closing drawer');
      scaffoldKey.currentState!.closeDrawer();
    } else {
      AppLogger.log('Opening drawer');
      scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  void onClose() {
    super.onClose();

    // dispose controllers
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

    // dispose focus nodes
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
}
