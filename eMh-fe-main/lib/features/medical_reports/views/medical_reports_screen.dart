import 'package:e_medfile/core/routes.enum.dart';
import 'package:e_medfile/features/medical_reports/controllers/medical_reports_controller.dart';
import 'package:e_medfile/features/medical_reports/widgets/medical_report_detail_tile.dart';
import 'package:e_medfile/features/medical_reports/widgets/no_medical_reports_found.dart';
import 'package:e_medfile/features/medical_reports/widgets/no_search_result_found.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/theme/font_config.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:e_medfile/widgets/app_scaffold.dart';
import 'package:e_medfile/widgets/buttons/app_button.dart';
import 'package:e_medfile/widgets/buttons/rounded_icon_button.dart';
import 'package:e_medfile/widgets/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MedicalReportsScreen extends GetView<MedicalReportsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffold(
        resizeToAvoidBottomInset: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        titleText: 'Medical Reports',
        hasBackButton: true,
        hasHeaderPrefix: true,
        hasHeaderSpacing: false,
        headerPrefix: _headerPrefix(),
        hasInsideBorder: _noSearchResultFound(),
        insideBorderPadding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        body: _noSearchResultFound()
            ? NoSearchResultFound()
            : Column(
                children: [
                  controller.medicalReports.isEmpty
                      ? NoMedicalReportsFound()
                      : Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: controller.medicalReports.length,
                            separatorBuilder: (_, __) => Gap(10.h),
                            itemBuilder: (_, index) => MedicalReportDetailTile(
                              report: controller.medicalReports[index],
                              onTap: () =>
                                  Get.toNamed(Routes.reportDetails.name),
                            ),
                          ),
                        ),
                  Gap(10.h),
                  AppButton.text(
                    text: 'Add a report',
                    onPressed: () => Get.toNamed(Routes.addMedicalReports.name),
                  )
                ],
              ),
      ),
    );
  }

  Widget _headerPrefix() {
    return Container(
      // height: 26.h,
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '2024',
            style: Get.theme.textTheme.bodySmall!.copyWith(
              color: AppColors.darkgreyText,
              fontWeight: FontWeight.w600,
              fontFamily: FontConfig.poppins,
            ),
          ),
          Obx(() => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  !controller.isSearchMode.value
                      ? RoundedIconButton(
                          icon: Icons.search_rounded,
                          iconSize: 16.r,
                          color: AppColors.greyText,
                          onPressed: () {
                            controller.isSearchMode.value = true;
                            controller.searchQuery.value = '';
                            controller.searchFocusNode.requestFocus();
                          },
                          borderSide: BorderSide.none,
                        )
                      : AnimatedContainer(
                          width: 169.w,
                          duration: Duration(milliseconds: 300),
                          child: CustomTextField.search(
                            isSearchModeEnabled: controller.isSearchMode,
                            controller: controller.searchController,
                            focusNode: controller.searchFocusNode,
                            onChanged: (value) {
                              controller.searchQuery.value = value;
                              controller.searchQuery.refresh();
                            },
                            hasResetFieldButton: true,
                          ),
                        ),
                  Gap(8.w),
                  RoundedIconButton(
                    icon: Icons.tune,
                    iconSize: 16.r,
                    color: AppColors.greyText,
                    padding: EdgeInsets.zero,
                    onPressed: () => controller.filterReports(),
                    borderSide: BorderSide.none,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  bool _noSearchResultFound() {
    AppLogger.log(controller.isSearchMode.value.toString());
    AppLogger.log(controller.searchController.text);
    return controller.isSearchMode.value &&
        controller.searchQuery.isNotEmpty;
  }
}
