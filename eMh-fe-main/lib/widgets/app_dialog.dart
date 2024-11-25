import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/utils/enums/dialog_type.enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String message;
  final TextStyle? titleStyle;
  final EdgeInsets? titlePadding;
  final TextStyle? messageStyle;
  final EdgeInsets? messagePadding;
  final bool hasSecondaryButton;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final EdgeInsets? buttonPadding;
  final String? secondaryButtonText;
  final BorderRadius? borderRadius;
  final VoidCallback onPressed;
  final VoidCallback? onSecondaryPressed;
  final Color? buttonColor;
  final Color? secondaryButtonColor;
  final EdgeInsets? padding;
  final double? width;
  final Color? color;

  const AppDialog({
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
    this.buttonColor,
    this.secondaryButtonColor,
    this.titlePadding,
    this.titleStyle,
    this.messagePadding,
    this.messageStyle,
    this.hasSecondaryButton = false,
    this.buttonTextStyle,
    this.buttonPadding,
    this.padding,
    this.width,
    this.borderRadius,
    this.color,
  }) : assert(
          hasSecondaryButton ||
              (secondaryButtonText == null &&
              onSecondaryPressed == null &&
              secondaryButtonColor == null),
          'Secondary button properties must be null if hasSecondaryButton is false',
        ),
        assert(
          !hasSecondaryButton ||
              (secondaryButtonText != null &&
              onSecondaryPressed != null),
          'Secondary button text and onSecondaryPressed are required if hasSecondaryButton is true',
        );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          decoration: BoxDecoration(
            color: color ?? AppColors.light,
          ),
          width: width ?? 280.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: titlePadding ?? EdgeInsets.all(16.r),
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: titleStyle ??
                        Get.textTheme.titleLarge!
                            .copyWith(color: AppColors.dark)),
              ),
              Padding(
                padding:
                    messagePadding ?? EdgeInsets.symmetric(horizontal: 16.r),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: messageStyle ??
                      Get.textTheme.labelMedium!.copyWith(
                        color: AppColors.darkgreyText,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Material(
                      color: buttonColor ?? AppColors.primary,
                      child: InkWell(
                        splashColor: AppColors.dark.withOpacity(0.1),
                        highlightColor: AppColors.dark.withOpacity(0.2),
                        onTap: onPressed,
                        child: Container(
                          padding: buttonPadding ??
                              EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 13.h),
                          width: width != null ? width! * 0.5 : 125.w,
                          child: Text(
                            buttonText,
                            style: buttonTextStyle ?? Get.textTheme.labelMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (hasSecondaryButton) ...[
                    Expanded(
                      child: Material(
                        color: secondaryButtonColor ?? AppColors.primary,
                        child: InkWell(
                          splashColor: AppColors.dark.withOpacity(0.1),
                          highlightColor: AppColors.dark.withOpacity(0.2),
                          onTap: onSecondaryPressed,
                          child: Container(
                            padding: buttonPadding ??
                                EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 13.h),
                            width: width != null ? width! * 0.5 : 125.w,
                            child: Text(
                              secondaryButtonText!,
                              style: buttonTextStyle ?? Get.textTheme.labelMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void show({
    required String title,
    required String message,
    required String buttonText,
    required VoidCallback onPressed,
    Color? buttonColor,
    String? secondaryButtonText,
    VoidCallback? onSecondaryPressed,
    Color? secondaryButtonColor,
    bool hasSecondaryButton = false,
    EdgeInsets? titlePadding,
    TextStyle? titleStyle,
    EdgeInsets? messagePadding,
    TextStyle? messageStyle,
    TextStyle? buttonTextStyle,
    EdgeInsets? buttonPadding,
    EdgeInsets? padding,
    double? width,
    BorderRadius? borderRadius,
    Color? color,
    bool isDismissible = true,
    required DialogType dialogType,
  }) {
    Get.dialog(
      barrierDismissible: isDismissible,
      name: dialogType.name,
      AppDialog(
        title: title,
        message: message,
        buttonText: buttonText,
        hasSecondaryButton: hasSecondaryButton,
        secondaryButtonText: secondaryButtonText,
        onPressed: onPressed,
        onSecondaryPressed: onSecondaryPressed,
        buttonColor: buttonColor,
        secondaryButtonColor: secondaryButtonColor,
        titlePadding: titlePadding,
        titleStyle: titleStyle,
        messagePadding: messagePadding,
        messageStyle: messageStyle,
        buttonTextStyle: buttonTextStyle,
        buttonPadding: buttonPadding,
        padding: padding,
        width: width,
        borderRadius: borderRadius,
        color: color,
      ),
    );
  }

  static void showLogoutDialog({required VoidCallback onLogoutPressed}) {
    AppDialog.show(
      dialogType: DialogType.logout,
      title: 'Logout',
      message: 'Your profile will be logged out...',
      buttonText: 'Cancel',
      onPressed: () {
        Get.back();
      },
      hasSecondaryButton: true,
      secondaryButtonText: 'Logout',
      onSecondaryPressed: onLogoutPressed,
    );
  }

  static void showDeleteAccountDialog({required VoidCallback onDeletePressed}) {
    AppDialog.show(
      isDismissible: true,
      dialogType: DialogType.deleteAccount,
      title: 'Please re-confirm if you want to delete your account',
      titleStyle: Get.theme.textTheme.labelSmall!.copyWith(color: AppColors.dark, fontWeight: FontWeight.bold,),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
      message:
          'This will permanently inactivate your account and you will no-longer have access to your profile information and medical reports.',
      buttonText: 'Delete',
      buttonColor: AppColors.errorText,
      onPressed: onDeletePressed,
      hasSecondaryButton: false,
    );
  }

  static void showDeleteConnectionDialog({required VoidCallback onYesPressed}) {
    AppDialog.show(
      dialogType: DialogType.deleteConnection,
      title: 'Delete Connection?',
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
      message: 'Are you sure you want to delete the family connection?',
      buttonColor: AppColors.primary,
      buttonText: 'Yes',
      onPressed: onYesPressed,
      hasSecondaryButton: false,
      secondaryButtonText: 'No',
      onSecondaryPressed: () {
        Get.back();
      },
    );
  }
}
