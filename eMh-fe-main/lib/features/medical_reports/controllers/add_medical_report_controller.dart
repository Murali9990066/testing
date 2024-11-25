import 'package:e_medfile/features/medical_reports/models/medical_report.dart';
import 'package:e_medfile/features/profile/services/profile_service.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:e_medfile/utils/enums/patient.enum.dart';
import 'package:e_medfile/utils/enums/report_reason.enum.dart';
import 'package:e_medfile/widgets/bottomsheet/app_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddMedicalReportController extends GetxController {
  final ProfileService _profileService;

  AddMedicalReportController(this._profileService);

  final Rxn<Patient> selectedPatient = Rxn<Patient>();
  final Rx<List<ReportReason>> selectedReportReason =
      Rx<List<ReportReason>>([]);
  final Rxn<DateTime> selectedDate = Rxn<DateTime>();
  final Rxn<String> selectedReportImage = Rxn<String>();

  final RxList<MedicalReport> medicalReports = RxList.empty();

  // Text editing controllers
  final patientController = TextEditingController();
  final doctorNameController = TextEditingController();
  final dateController = TextEditingController();
  final reportReasonController = TextEditingController();
  final reportAnalysisController = TextEditingController();

  // Focus nodes
  final patientFocusNode = FocusNode();
  final doctorNameFocusNode = FocusNode();
  final dateFocusNode = FocusNode();
  final reportReasonFocusNode = FocusNode();
  final reportAnalysisFocusNode = FocusNode();

  // Enabled states
  final isPatientEnabled = true.obs;
  final isDoctorNameEnabled = true.obs;
  final isDateEnabled = true.obs;
  final isReportReasonEnabled = true.obs;
  final isReportAnalysisEnabled = true.obs;

  void getInitialData() {
    selectedPatient.value = _profileService.getSelectedPatient();
    selectedReportReason.value = _profileService.getSelectedReportReasons();
  }

  @override
  void onInit() {
    super.onInit();
    getInitialData();
  }

  void addReport() {
    medicalReports.add(MedicalReport(
      reportId: '1',
      patientName: selectedPatient.value?.name,
      reportReasons: selectedReportReason.value.map((e) => e.name).toList(),
      date: selectedDate.value?.toString(),
      reportImage: selectedReportImage.value,
    ));
  }

  void selectPatient() async {
    await AppBottomSheet.showSelectionBottomSheet<Patient>(
      title: 'Patient',
      options: Patient.values,
      initialValue: selectedPatient.value,
      displayName: (patient) => patient.name.capitalize!,
      onBottomSheetClosed: (value) {
        patientFocusNode.unfocus(); // Toggle focus to false
      },
      onDonePressed: (result) {
        var patient = result as Patient;
        AppLogger.log('On done pressed ${patient.toString()}');
        selectedPatient.value = patient;
        patientController.text = patient.name.capitalize!; // Set the returned value
        patientFocusNode.unfocus(); // Toggle focus to false
      },
    );
    // _profileService.setSelectedPatient(selectedPatient.value);
    // AppLogger.log('Selected patient: ${selectedPatient.value?.name}');
  }

  void selectDate() async {
    selectedDate.value = await AppBottomSheet.showDatePickerBottomSheet(
      title: 'Report Date',
      onDonePressed: (date) {
        selectedDate.value = date;
        dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate.value!);
        dateFocusNode.unfocus();
      },
      onBottomSheetClosed: (date) {
        dateFocusNode.unfocus();
      },
    );
  }

  void selectReportReason() async {
    await AppBottomSheet.showSelectionBottomSheet<ReportReason>(
      title: 'Report Reason',
      options: ReportReason.values.toList(),
      initialValue: selectedReportReason.value,
      displayName: (reportReason) => reportReason.name.capitalize!,
      isMultiSelect: true,
      onBottomSheetClosed: (value) {
        reportReasonFocusNode.unfocus(); // Toggle focus to false
      },
      onDonePressed: (reportReasons) {
        var reasons = reportReasons as List<ReportReason>;
        AppLogger.log('On done pressed ${reportReasons.toString()}');
        selectedReportReason.value = reasons;
        reportReasonController.text = reportReasons
            .map((reason) => reason.name.capitalize)
            .join(', '); // Set the returned value
        reportReasonFocusNode.unfocus(); // Toggle focus to false
      },
    );
  }

  uploadReports() {
    AppLogger.log('Uploading reports');
    AppBottomSheet.showFilePickerBottomSheet(
      title: 'Add a record',
      onFilePicked: (file) {
        AppLogger.log('Image picked: ${file.path.toString()}');
      },
      hasFileOption: true,
    );
  }

  @override
  void onClose() {
    // Dispose of controllers
    patientController.dispose();
    doctorNameController.dispose();
    reportAnalysisController.dispose();

    // Dispose of focus nodes
    patientFocusNode.dispose();
    doctorNameFocusNode.dispose();
    reportAnalysisFocusNode.dispose();
    super.onClose();
  }
}
