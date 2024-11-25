class MedicalReport {
  final String? patientName;
  final String? patientPhone;
  final String? patientEmail;
  final String? patientAddress;
  final String? patientGender;
  final String? patientAge;
  final String? patientHeight;
  final String? patientWeight;
  final String? date;
  final List<String>? reportReasons;
  final String? doctorName;
  final String? reportImage;
  final String? patientImage;
  final String reportId;
  MedicalReport({
    this.patientName,
    this.patientPhone,
    this.patientEmail,
    this.patientAddress,
    this.patientGender,
    this.patientAge,
    this.patientHeight,
    this.patientWeight,
    this.date,
    this.reportReasons,
    this.doctorName,
    this.reportImage,
    this.patientImage,
    required this.reportId,
  });
}