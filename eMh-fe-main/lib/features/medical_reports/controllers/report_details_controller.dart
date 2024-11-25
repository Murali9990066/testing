import 'package:e_medfile/features/medical_reports/models/medical_report.dart';
import 'package:e_medfile/features/profile/services/profile_service.dart';
import 'package:get/get.dart';

class ReportDetailsController extends GetxController {
  final report = Rxn<MedicalReport>();

  @override
  void onInit() {
    super.onInit();
    report.value = MedicalReport(
      reportId: '1',
      patientName: 'John Doe',
      patientPhone: '1234567890',
      patientEmail: 'john.doe@example.com',
      patientAddress: '1234 Main St, Anytown, USA',
      patientGender: 'Male',
      patientAge: '30',
      patientHeight: '180 cm',
      patientWeight: '70 kg',
      date: '2024-01-01',
      reportReasons: ['Fever', 'Cough', 'Allergies'],
      doctorName: 'Dr. John Doe',
      reportImage: Get.find<ProfileService>().getUserProfileImage(),
    );
  }
}


