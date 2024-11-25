import 'dart:io';

import 'package:e_medfile/core/permission_service.dart';
import 'package:e_medfile/features/country_code_picker/country_code_picker_controller.dart';
import 'package:e_medfile/features/language/language_controller.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/theme/font_config.dart';
import 'package:e_medfile/utils/app_logger/app_logger.dart';
import 'package:e_medfile/widgets/bottomsheet/app_bottomsheet_header.dart';
import 'package:e_medfile/widgets/buttons/app_button.dart';
import 'package:e_medfile/widgets/buttons/rounded_icon_button.dart';
import 'package:e_medfile/widgets/listtiles/app_bottomsheet_checkbox_listtile.dart';
import 'package:e_medfile/widgets/textfields/custom_textfield.dart';
import 'package:e_medfile/widgets/touch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final bool hasCloseButton;
  final double? borderRadius;
  const AppBottomSheet({
    this.child,
    this.padding,
    this.hasCloseButton = true,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width.w,
      constraints: BoxConstraints.loose(Size(Get.width, Get.height)),
      padding: padding ?? EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? 8.r),
          topRight: Radius.circular(borderRadius ?? 8.r),
        ),
      ),
      child: Column(
        children: [
          if (hasCloseButton)
            Padding(
              padding: EdgeInsets.only(top: 20.w, right: 20.w),
              child: Align(
                alignment: Alignment.topRight,
                child: RoundedIconButton(
                  icon: Icons.close,
                  onPressed: () => Get.back(),
                ),
              ),
            ),
          child ?? Container(),
        ],
      ),
    );
  }

  static Future<dynamic> show({
    required Widget child,
    EdgeInsets? padding,
    bool hasCloseButton = true,
    bool hasIntrinsicHeight = false,
    double? borderRadius,
    VoidCallback? onBottomSheetClosed,
    double? minHeight,
    double? maxHeight,
  }) {
    return Get.bottomSheet(
      enterBottomSheetDuration: const Duration(milliseconds: 300),
      exitBottomSheetDuration: const Duration(milliseconds: 300),
      isScrollControlled: true,
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: minHeight ?? Get.height * 0.2,
          maxHeight: maxHeight ?? Get.height * 0.7,
        ),
        child: hasIntrinsicHeight
            ? IntrinsicHeight(
                child: AppBottomSheet(
                  padding: padding,
                  hasCloseButton: hasCloseButton,
                  borderRadius: borderRadius,
                  child: child,
                ),
              )
            : AppBottomSheet(
                padding: padding,
                hasCloseButton: hasCloseButton,
                child: child,
              ),
      ),
    ).then((value) => onBottomSheetClosed?.call());
  }

  static Future<dynamic> showLanguageBottomSheet(
    LanguageController languageController, {
    EdgeInsets? padding,
    bool hasCloseButton = true,
    VoidCallback? onBottomSheetClosed,
  }) {
    return AppBottomSheet.show(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 0.w),
      hasCloseButton: hasCloseButton,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBottomSheetHeader(title: 'Choose Your Preferred Language', hasDivider: false,),
          Gap(20.h),
          Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: languageController.languages.length,
                itemBuilder: (context, index) {
                  return Obx(() => TouchWidget(
                        child: RadioListTile(
                          overlayColor: WidgetStateProperty.all(
                              AppColors.greyFadedBorder),
                          title: Text(
                            languageController.languages[index].name,
                            style: Get.theme.textTheme.bodyMedium!.copyWith(
                              color: languageController
                                          .selectedLanguage.value ==
                                      languageController.languages[index].code
                                  ? AppColors.darkPrimaryText
                                  : AppColors.greyText,
                            ),
                          ),
                          value: languageController.languages[index].code,
                          groupValue: languageController.selectedLanguage.value,
                          activeColor: AppColors.darkPrimaryLightText,
                          selectedTileColor: AppColors.darkPrimaryLightText,
                          // tileColor: AppColors.greyText,
                          fillColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return AppColors.darkPrimaryLightText;
                              }
                              return AppColors.greyText;
                            },
                          ),
                          onChanged: (value) {
                            languageController.selectLanguage(value!);
                          },
                        ),
                      ));
                },
              ))
        ],
      ),
    ).then((value) => onBottomSheetClosed?.call());
  }

  static Future<dynamic> showCountryCodePicker({
    required CountryCodePickerController controller,
    EdgeInsets? padding,
    bool hasCloseButton = true,
    VoidCallback? onBottomSheetClosed,
  }) {
    return AppBottomSheet.show(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 0.w),
      hasCloseButton: hasCloseButton,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBottomSheetHeader(title: 'Select Country Code', hasDivider: false,),
          Gap(10.h),
          Divider(
            color: AppColors.greyFadedBorder,
            height: 0,
          ),
          Gap(10.h),
          Obx(() => ListView.separated(
                shrinkWrap: true,
                itemCount: controller.countryCodes.length,
                separatorBuilder: (_, __) => const Divider(
                  color: AppColors.greyFadedBorder,
                  height: 0,
                ),
                itemBuilder: (context, index) {
                  AppLogger.log(
                      'controller.countryCodes[index].name: ${controller.countryCodes[index].name}');
                  final countryCode = controller.countryCodes[index];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        controller.pickCountryCode(countryCode);
                        Get.back();
                      },
                      child: ListTile(
                        title: Text(countryCode.codeWithPlus,
                            style: Get.theme.textTheme.bodyMedium!.copyWith(
                                color: AppColors.darkPrimaryText,
                                fontWeight: FontWeight.bold)),
                        trailing: Text(countryCode.name,
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(color: AppColors.darkPrimaryText)),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    ).then((value) => onBottomSheetClosed?.call());
  }

  static Future<dynamic> showSelectionBottomSheet<T>({
    required String title,
    String? subtitle,
    required List<T> options,
    required dynamic initialValue,
    required String Function(T) displayName,
    EdgeInsets? padding,
    bool isMultiSelect = false,
    required Function(dynamic) onBottomSheetClosed,
    required Function(dynamic) onDonePressed,
  }) {
    var tempSelectedValue = isMultiSelect
        ? RxList<T>(initialValue != null ? List<T>.from(initialValue) : [])
        : Rxn<T>(initialValue);

    return AppBottomSheet.show(
      padding: EdgeInsets.zero,
      hasCloseButton: false,
      hasIntrinsicHeight:
          true, // ! Do not change this to false; else would cause the layout to expand
      borderRadius: 16.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBottomSheetHeader(
            title: title,
            padding: padding,
            onDonePressed: () {
              final selectedValues = isMultiSelect
                  ? (tempSelectedValue as RxList<T>).toList()
                  : (tempSelectedValue as Rxn<T>).value;

              // if selected values is not null, then call onDonePressed
              if (selectedValues != null) {
                onDonePressed.call(selectedValues);
              }
              Get.back();
            },
          ),
          if (subtitle != null && subtitle.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.only(
                  top: 20.w, bottom: 10.w, left: 20.w, right: 20.w),
              child: Text(
                subtitle,
                style: Get.theme.textTheme.headlineLarge!.copyWith(
                    color: AppColors.darkgreyText, fontWeight: FontWeight.bold),
              ),
            )
          ],
          ...options.map(
            (option) => AppBottomSheetCheckBoxListTile<T>(
              value: option,
              selectedValue: tempSelectedValue,
              displayName: displayName,
              padding: padding,
              isMultiSelect: isMultiSelect,
            ),
          ),
        ],
      ),
    ).then((value) => onBottomSheetClosed.call(value));
  }

  static Future<dynamic> showFilePickerBottomSheet({
    String? title,
    required Function(File) onFilePicked,
    bool hasCameraOption = true,
    bool hasGalleryOption = true,
    bool hasFileOption = false,
    VoidCallback? onBottomSheetClosed,
  }) {
    final ImagePicker _picker = ImagePicker();

    Future<void> pickAndProcessFile(ImageSource source) async {
      bool hasPermission = await PermissionService.to
          .checkAndRequestImagePickerPermission(source);

      if (hasPermission) {
        try {
          final XFile? file = await _picker.pickImage(source: source);
          if (file != null) {
            onFilePicked(File(file.path));
            Get.back(); // Close the bottom sheet after successful pick
          }
        } catch (e) {
          AppLogger.log('Error picking file: $e');
          Get.snackbar('Error', 'Failed to pick image');
        }
      } else {
        Get.snackbar('Permission Denied',
            'Please grant permission to access ${source == ImageSource.camera ? 'camera' : 'gallery'}');
      }
    }

    return AppBottomSheet.show(
      hasCloseButton: false,
      hasIntrinsicHeight: true,
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Column(
        children: [
          AppBottomSheetHeader(title: title ?? 'Add Profile Image'),
          if (hasCameraOption) ...[
            TouchWidget(
              splashColor: AppColors.primary,
              highlightColor: AppColors.primary,
              child: ListTile(
                title: Text(
                  'Camera',
                  textAlign: TextAlign.center,
                ),
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () async => await pickAndProcessFile(ImageSource.camera),
              ),
            ),
          ],
          if (hasGalleryOption) ...[
            Divider(
              color: AppColors.greyFadedBorder,
              height: 0,
            ),
            TouchWidget(
              child: ListTile(
                title: Text(
                  'Gallery',
                  textAlign: TextAlign.center,
                ),
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () async =>
                    await pickAndProcessFile(ImageSource.gallery),
              ),
            ),
          ],
          if (hasFileOption) ...[
            Divider(
              color: AppColors.greyFadedBorder,
              height: 0,
            ),
            TouchWidget(
              child: ListTile(
                title: Text(
                  'File',
                  textAlign: TextAlign.center,
                ),
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () async =>
                    await pickAndProcessFile(ImageSource.gallery),
              ),
            ),
          ],
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            child: AppButton.text(
              text: 'Cancel',
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    ).then((value) => onBottomSheetClosed?.call());
  }

  static Future<dynamic> showDatePickerBottomSheet({
    String? title,
    bool hasDoneButton = true,
    required Function(DateTime?)? onDonePressed,
    required Function(DateTime?)? onBottomSheetClosed,
    DateTime? selectedDay,
    DateTime? lastDay,
    DateTime? firstDay,
  }) {
    final Rx<DateTime?> _selectedDay = Rx<DateTime?>(selectedDay);
    final Rx<DateTime> _focusedDay =
        Rx<DateTime>(selectedDay ?? DateTime.now());

    return AppBottomSheet.show(
      padding: EdgeInsets.zero,
      hasCloseButton: false,
      hasIntrinsicHeight:
          false, // ! Do not change this to true; else would cause layout issues
      maxHeight: Get.height * 0.61,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppBottomSheetHeader(
          title: 'Select Date',
          onDonePressed: () {
            // if selected day is not null, then call onDonePressed
            if (_selectedDay.value != null) {
              onDonePressed!(_selectedDay.value);
            }
            Get.back();
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => TableCalendar(
                focusedDay: _focusedDay.value,
                pageJumpingEnabled: true,
                rowHeight: 40.h,
                daysOfWeekHeight: 40.h,
                startingDayOfWeek: StartingDayOfWeek.monday,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: Get.theme.textTheme.titleMedium!.copyWith(
                    color: AppColors.darkgreyText,
                    fontFamily: FontConfig.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                  weekendStyle: Get.theme.textTheme.titleMedium!.copyWith(
                    color: AppColors.darkgreyText,
                    fontFamily: FontConfig.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                  dowTextFormatter: (date, locale) =>
                      DateFormat.E(locale).format(date).substring(0, 2),
                ),
                firstDay: firstDay ??
                    DateTime.now().subtract(const Duration(days: 365 * 100)),
                lastDay: lastDay ?? DateTime.now(),
                // lastDay: DateTime.now(),
                weekendDays: const [DateTime.sunday],
                calendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  // tablePadding: EdgeInsets.all(16.w),
                  // cellPadding: EdgeInsets.all(10.w),
                  // markerDecoration: BoxDecoration(
                  //   color: AppColors.primary,
                  //   shape: BoxShape.circle,
                  // ),
                  selectedDecoration: BoxDecoration(
                    color: AppColors.light,
                    border: Border.all(color: AppColors.primary),
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: Get.theme.textTheme.titleMedium!.copyWith(
                    color: AppColors.primary,
                    fontFamily: FontConfig.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                  todayTextStyle: Get.theme.textTheme.titleMedium!.copyWith(
                    color: AppColors.light,
                    fontFamily: FontConfig.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                  todayDecoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  disabledTextStyle: Get.theme.textTheme.titleMedium!.copyWith(
                    color: AppColors.lightGreyText,
                    fontFamily: FontConfig.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                  defaultTextStyle: Get.theme.textTheme.titleMedium!.copyWith(
                    color: AppColors.greyText,
                    fontFamily: FontConfig.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                  weekendTextStyle: Get.theme.textTheme.titleMedium!.copyWith(
                    color: AppColors.greyFadedBorder,
                    fontFamily: FontConfig.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay.value, day);
                },
                onDaySelected: (selected, focusedDay) {
                  _selectedDay.value = selected;
                  _focusedDay.value = focusedDay;
                  // Get.back();
                },
                headerStyle: HeaderStyle(
                  headerPadding: EdgeInsets.zero,
                  headerMargin: EdgeInsets.only(bottom: 8.h),
                  formatButtonVisible: false,
                  leftChevronPadding: EdgeInsets.zero,
                  rightChevronPadding: EdgeInsets.zero,
                  leftChevronIcon: RoundedIconButton(
                    isActive: false,
                    borderSide: BorderSide.none,
                    backgroundColor: AppColors.lightGreyText,
                    icon: Icons.chevron_left_rounded,
                    iconSize: 22.r,
                    color: AppColors.darkgreyText,
                    padding: EdgeInsets.all(8.r),
                    onPressed: () {},
                  ),
                  rightChevronIcon: RoundedIconButton(
                    isActive: false,
                    borderSide: BorderSide.none,
                    backgroundColor: AppColors.lightGreyText,
                    icon: Icons.chevron_right_rounded,
                    iconSize: 22.r,
                    color: AppColors.darkgreyText,
                    padding: EdgeInsets.all(8.r),
                    onPressed: () {},
                  ),
                  titleCentered: true,
                  titleTextStyle: Get.theme.textTheme.displaySmall!.copyWith(
                    color: AppColors.darkTextFaded,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontConfig.poppins,
                  ),
                  titleTextFormatter: (date, locale) =>
                      DateFormat('MMMM yyyy', locale)
                          .format(date)
                          .toUpperCase(),
                ),
              )),
        )
      ]),
    ).then((value) => onBottomSheetClosed?.call(value));
  }

  static Future<dynamic> showFilterBottomSheet({
    required Function(dynamic) onFilterSelected,
    required Function(dynamic) onBottomSheetClosed,
  }) {
    return AppBottomSheet.show(
      hasCloseButton: false,
      hasIntrinsicHeight: true,
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Column(
        children: [
          AppBottomSheetHeader(title: 'Filter By'),
          Container(
            width: Get.width.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 23.h),
            child: Column(
              children: [
                CustomTextField.bordered(
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  hintText: 'Doctor Name',
                  labelText: 'Doctor Name',
                  borderColor: AppColors.greyFadedBorder,
                  hintTextColor: AppColors.greyFadedBorder,
                ),
                Gap(20.h),
                CustomTextField.bordered(
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  hintText: 'Report Reason',
                  labelText: 'Report Reason',
                ),
                Gap(20.h),
                CustomTextField.bordered(
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  hintText: 'Pateint Name',
                  labelText: 'Pateint Name',
                ),
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: CustomTextField.bordered(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        hintText: 'Start Date',
                        labelText: 'Start Date',
                      ),
                    ),
                    SizedBox(
                      width: 150.w,
                      child: CustomTextField.bordered(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        hintText: 'End Date',
                        labelText: 'End Date',
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
                AppButton.text(
                  text: 'Show Reports',
                  onPressed: () => {AppLogger.log('Show Reports'), Get.back()},
                )
              ],
            ),
          )
        ],
      ),
    ).then((value) => onBottomSheetClosed?.call(value));
  }
}
