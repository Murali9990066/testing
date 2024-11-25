import 'package:e_medfile/features/country_code_picker/country_code_picker_controller.dart';
import 'package:e_medfile/widgets/bottomsheet/app_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CountryCodePicker extends StatelessWidget {
  final CountryCodePickerController controller;
  final VoidCallback onChanged;
  final VoidCallback onTap;
  final Color? color;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final EdgeInsets? padding;
  final Color? overlayColor;

  const CountryCodePicker({
    required this.controller,
    required this.onChanged,
    required this.onTap,
    this.color,
    this.borderRadius,
    this.borderSide,
    this.padding,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius ?? BorderRadius.circular(12.r),
          onTap: () {
            onTap();
            AppBottomSheet.showCountryCodePicker(controller: controller)
                .then((_) {
              onChanged();
            });
          },
          child: Obx(() => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(controller.pickedCountryCode.value.codeWithPlus),
              SizedBox(width: 4.w),
              const Icon(Icons.keyboard_arrow_down, size: 16)
            ],
          )),
        ),
      ),
    );
  }
}
