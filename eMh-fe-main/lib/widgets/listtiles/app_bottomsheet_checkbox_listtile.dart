import 'package:e_medfile/widgets/touch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/color_theme.dart';

class AppBottomSheetCheckBoxListTile<T> extends StatelessWidget {
  final T value;
  final dynamic selectedValue;
  final String Function(T) displayName;
  final EdgeInsets? padding;
  final bool isMultiSelect;

  const AppBottomSheetCheckBoxListTile({
    required this.value,
    required this.selectedValue,
    required this.displayName,
    this.padding,
    this.isMultiSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return TouchWidget(
      padding: padding,
      onTap: () {
        if (isMultiSelect) {
          if (selectedValue is RxList<T>) {
            if (selectedValue.contains(value)) {
              selectedValue.remove(value);
            } else {
              selectedValue.add(value);
            }
          }
        } else {
          if (selectedValue is Rxn<T>) {
            selectedValue.value = value;
          }
        }
      },
      child: Obx(() => CheckboxListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
        title: Text(displayName(value),
            style: Get.theme.textTheme.labelLarge!
                .copyWith(color: AppColors.dark)),
        value: isMultiSelect
            ? (selectedValue as RxList<T>).contains(value)
            : (selectedValue as Rxn<T>).value == value,
        activeColor: AppColors.primary,
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        checkColor: AppColors.light,
        selectedTileColor: AppColors.primary,
        tileColor: AppColors.light,
        onChanged: null,
        controlAffinity: ListTileControlAffinity.trailing,
        fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.secondary;
          }
          return AppColors.light;
        }),
      )),
    );
  }
}