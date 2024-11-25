import 'package:e_medfile/features/medical_reports/controllers/add_medical_report_controller.dart';
import 'package:e_medfile/utils/enums/report_reason.enum.dart';
import 'package:e_medfile/widgets/app_chips.dart';
import 'package:e_medfile/widgets/app_scaffold.dart';
import 'package:e_medfile/widgets/buttons/app_button.dart';
import 'package:e_medfile/widgets/textfields/info_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddReportsScreen extends GetView<AddMedicalReportController> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      titleText: 'Add Reports',
      hasBackButton: true,
      hasHeaderSpacing: false,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Column(
              children: [
                InfoTextField.openBottomSheet(
                  hintText: 'Select patient',
                  labelText: 'Patient',
                  controller: controller.patientController,
                  focusNode: controller.patientFocusNode,
                  isFieldEnabled: controller.isPatientEnabled,
                  onAddIconPressed: () => controller.selectPatient(),
                ),
                Gap(15.h),
                InfoTextField.simple(
                  hintText: 'Enter doctor name',
                  labelText: 'Doctor Name',
                  controller: controller.doctorNameController,
                  focusNode: controller.doctorNameFocusNode,
                  isFieldEnabled: controller.isDoctorNameEnabled,
                ),
                Gap(15.h),
                InfoTextField.openBottomSheet(
                  hintText: 'Select date',
                  labelText: 'Date',
                  controller: controller.dateController,
                  focusNode: controller.dateFocusNode,
                  isFieldEnabled: controller.isDateEnabled,
                  onAddIconPressed: () => controller.selectDate(),
                ),
                Gap(15.h),
                InfoTextField.openBottomSheet(
                  hintText: 'Enter report reason',
                  labelText: 'Report Reason',
                  controller: controller.reportReasonController,
                  focusNode: controller.reportReasonFocusNode,
                  isFieldEnabled: controller.isReportReasonEnabled,
                  onAddIconPressed: () => controller.selectReportReason(),
                ),
                Gap(15.h),
                Row(
                  children: [
                    AppChips(text: ReportReason.cough.name),
                    Gap(5.w),
                    AppChips(text: ReportReason.allergies.name),
                  ],
                ),
                Gap(15.h),
                InfoTextField.simple(
                  hintText: 'Enter report analysis',
                  labelText: 'Report Analysis',
                  controller: controller.reportAnalysisController,
                  focusNode: controller.reportAnalysisFocusNode,
                  isFieldEnabled: controller.isReportAnalysisEnabled,
                ),
                Spacer(),
                AppButton.text(
                  text: 'Upload Report',
                  onPressed: () {
                    controller.uploadReports();
                    // Get.toNamed(Routes.reportDetails.route);
                  },
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
