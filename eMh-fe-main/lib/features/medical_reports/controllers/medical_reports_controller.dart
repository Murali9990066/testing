import 'package:e_medfile/features/medical_reports/models/medical_report.dart';
import 'package:e_medfile/features/profile/services/profile_service.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:e_medfile/widgets/bottomsheet/app_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalReportsController extends GetxController {
  final ProfileService _profileService;
  MedicalReportsController(this._profileService);

  final RxList<MedicalReport> medicalReports = RxList.empty();
  final RxBool isSearchMode = false.obs;
  final TextEditingController searchController =
      TextEditingController(); // Add this line
  final FocusNode searchFocusNode = FocusNode();
  final RxString searchQuery = ''.obs;

  void _getInitialData() {
    medicalReports.add(MedicalReport(
      reportId: '1',
      patientName: 'Ravi',
      reportReasons: ['Fever', 'Cough'],
      date: '2024-01-01',
      patientImage: '',
    ));
    medicalReports.add(MedicalReport(
      reportId: '2',
      patientName: 'Ravi',
      reportReasons: ['Fever', 'Cough'],
      date: '2024-01-01',
      patientImage: '',
    ));
    medicalReports.add(MedicalReport(
      reportId: '3',
      patientName: 'Ravi',
      reportReasons: ['Fever', 'Cough'],
      date: '2024-01-01',
      patientImage: '',
    ));
    medicalReports.add(MedicalReport(
      reportId: '4',
      patientName: 'Ravi',
      reportReasons: ['Fever', 'Cough'],
      date: '2024-01-01',
      patientImage: '',
    ));
    medicalReports.add(MedicalReport(
      reportId: '5',
      patientName: 'Ravi',
      reportReasons: ['Fever', 'Cough'],
      date: '2024-01-01',
      patientImage: '',
    ));
    medicalReports.add(MedicalReport(
      reportId: '6',
      patientName: 'Ravi',
      reportReasons: ['Fever', 'Cough'],
      date: '2024-01-01',
      patientImage: '',
    ));
    medicalReports.add(MedicalReport(
      reportId: '7',
      patientName: 'Ravi',
      reportReasons: ['Fever', 'Cough'],
      date: '2024-01-01',
      patientImage: '',
    ));
    medicalReports.add(MedicalReport(
      reportId: '8',
      patientName: 'Ravi',
      reportReasons: ['Fever', 'Cough'],
      date: '2024-01-01',
      patientImage: '',
    ));
  }

  @override
  void onInit() {
    super.onInit();
    _getInitialData();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void filterReports() {
    AppBottomSheet.showFilterBottomSheet(
      onFilterSelected: (filter) {
        AppLogger.log(filter);
      },
      onBottomSheetClosed: (filter) {
        searchFocusNode.unfocus();
      },
    );
  }

  void deleteReport(String id) {
    AppLogger.log('Deleting report $id');
    medicalReports.removeWhere((report) => report.reportId == id);
  }

  void downloadReport(String id) {
    AppLogger.log('Downloading report $id');
  }
}
