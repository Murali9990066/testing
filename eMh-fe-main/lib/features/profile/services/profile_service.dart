import 'package:e_medfile/features/local_storage/local_storage.dart';
import 'package:e_medfile/utils/enums/diet_type.enum.dart';
import 'package:e_medfile/utils/enums/gender.enum.dart';
import 'package:e_medfile/utils/enums/local_storage_key_type.enum.dart';
import 'package:e_medfile/utils/enums/marital_status.enum.dart';
import 'package:e_medfile/utils/enums/patient.enum.dart';
import 'package:e_medfile/utils/enums/report_reason.enum.dart';

class ProfileService {
  final LocalStorage _local;
  ProfileService(this._local);

  // patient
  Patient? getSelectedPatient() {
    final patientName = _local.getData(LocalStorageKeyType.patient.name) as String?;
    return patientName != null ? Patient.values.firstWhere((p) => p.name == patientName) : null;
  }

  void setSelectedPatient(Patient? patient) => _local.setData(LocalStorageKeyType.patient.name, patient?.name);


  // report reason
  List<ReportReason> getSelectedReportReasons() {
    final reasonsString = _local.getData(LocalStorageKeyType.reportReason.name) as String?;
    if (reasonsString == null) return [];
    final reasonNames = reasonsString.split(',').where((s) => s.isNotEmpty).toList();
    return reasonNames.map((name) => ReportReason.values.firstWhere((r) => r.name == name)).toList();
  }

  void setSelectedReportReasons(List<ReportReason> reportReasons) {
    final reasonsString = reportReasons.map((r) => r.name).join(',');
    _local.setData(LocalStorageKeyType.reportReason.name, reasonsString);
  }


  // gender
  GenderType? getSelectedGender() {
    final genderName = _local.getData(LocalStorageKeyType.gender.name) as String?;
    return genderName != null ? GenderType.values.firstWhere((g) => g.name == genderName) : null;
  }

  void setSelectedGender(GenderType? gender) => _local.setData(LocalStorageKeyType.gender.name, gender?.name);


  // marital status
  MaritalStatus? getSelectedMaritalStatus() {
    final maritalStatusName = _local.getData(LocalStorageKeyType.maritalStatus.name) as String?;
    return maritalStatusName != null ? MaritalStatus.values.firstWhere((m) => m.name == maritalStatusName) : null;
  }

  void setSelectedMaritalStatus(MaritalStatus? maritalStatus) => _local.setData(LocalStorageKeyType.maritalStatus.name, maritalStatus?.name);


  // diet
  DietType? getSelectedDiet() {
    final dietName = _local.getData(LocalStorageKeyType.diet.name) as String?;
    return dietName != null ? DietType.values.firstWhere((d) => d.name == dietName) : null;
  }

  void setSelectedDiet(DietType? diet) => _local.setData(LocalStorageKeyType.diet.name, diet?.name);


  // profile image
  String getUserProfileImage() {
    return _local.getData(LocalStorageKeyType.userProfileImage.name) as String? ?? '';
  }

  void setUserProfileImage(String image) {
    _local.setData(LocalStorageKeyType.userProfileImage.name, image);
  }


  // user
  String getUserName() {
    return _local.getData(LocalStorageKeyType.userName.name) as String? ?? '';
  }

  void setUserName(String name) {
    _local.setData(LocalStorageKeyType.userName.name, name);
  }


  // user email
  String getUserEmail() {
    return _local.getData(LocalStorageKeyType.userEmail.name) as String? ?? '';
  }

  void setUserEmail(String email) {
    _local.setData(LocalStorageKeyType.userEmail.name, email);
  }


  // user contact number
  String getUserContactNumber() {
    return _local.getData(LocalStorageKeyType.userContactNumber.name) as String? ?? '';
  }

  void setUserContactNumber(String contactNumber) {
    _local.setData(LocalStorageKeyType.userContactNumber.name, contactNumber);
  }


  // user age
  String getUserAge() {
    return _local.getData(LocalStorageKeyType.userAge.name) ?? '';
  }

  void setUserAge(String age) {
    _local.setData(LocalStorageKeyType.userAge.name, age);
  }

  
  // user date of birth
  DateTime? getUserDateOfBirth() {
    return _local.getData(LocalStorageKeyType.userDateOfBirth.name);
  }

  void setUserDateOfBirth(DateTime? dateOfBirth) {
    _local.setData(LocalStorageKeyType.userDateOfBirth.name, dateOfBirth);
  }

  
  // user marital status
  String getUserMaritalStatus() {
    return _local.getData(LocalStorageKeyType.userMaritalStatus.name) as String? ?? '';
  }

  void setUserMaritalStatus(String maritalStatus) {
    _local.setData(LocalStorageKeyType.userMaritalStatus.name, maritalStatus);
  }


  // user height
  String getUserHeight() {
    return _local.getData(LocalStorageKeyType.userHeight.name) as String? ?? '';
  }

  void setUserHeight(String height) {
    _local.setData(LocalStorageKeyType.userHeight.name, height);
  }


  // user weight
  String getUserWeight() {
    return _local.getData(LocalStorageKeyType.userWeight.name) as String? ?? '';
  }

  void setUserWeight(String weight) {
    _local.setData(LocalStorageKeyType.userWeight.name, weight);
  }


  // user diet
  String getUserDiet() {
    return _local.getData(LocalStorageKeyType.userDiet.name) as String? ?? '';
  }

  void setUserDiet(String diet) {
    _local.setData(LocalStorageKeyType.userDiet.name, diet);
  }
}
