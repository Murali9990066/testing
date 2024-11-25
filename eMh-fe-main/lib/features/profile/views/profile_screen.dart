import 'dart:io';

import 'package:e_medfile/constants/app_constants.dart';
import 'package:e_medfile/features/dashboard/controllers/dashboard_controller.dart';
import 'package:e_medfile/features/dashboard/views/personal_tab_view.dart';
import 'package:e_medfile/theme/color_theme.dart';
import 'package:e_medfile/widgets/app_scaffold.dart';
import 'package:e_medfile/widgets/shadow_box.dart';
import 'package:e_medfile/widgets/textfields/info_textfield.dart';
import 'package:e_medfile/widgets/touch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() => AppScaffold(
              titleText: 'Profile',
              hasBackButton: true,
              actionText: controller.isEditingEnabled.value ? 'Save' : null,
              onActionTextTap: () => controller.saveProfile(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(37.h),
                    Obx(() => (!controller.isEditingEnabled.value)
                        ? TouchWidget(
                            onTap: () => controller.editProfile(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Edit Profile',
                                  style: Get.theme.textTheme.headlineMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primary),
                                ),
                                Gap(4.w),
                                Image.asset(
                                  AppConstants.image.edit,
                                  width: 12.w,
                                  height: 12.h,
                                ),
                              ],
                            ),
                          )
                        : Container()),
                    Gap(10.h),
                    InfoTextField.simple(
                      hintText: 'Enter your full name',
                      labelText: 'Name',
                      controller: controller.nameController,
                      focusNode: controller.nameFocusNode,
                      isFieldEnabled: controller.isNameEnabled,
                      isAddIconEnabled: controller.isEditingEnabled.value,
                    ),
                    Gap(15.h),
                    InfoTextField.simple(
                      hintText: 'Enter your email address',
                      labelText: 'Email',
                      controller: controller.emailController,
                      focusNode: controller.emailFocusNode,
                      isFieldEnabled: controller.isEmailEnabled,
                      isAddIconEnabled: controller.isEditingEnabled.value,
                    ),
                    Gap(15.h),
                    InfoTextField.simple(
                      hintText: 'Enter your phone number',
                      labelText: 'Contact Number',
                      controller: controller.contactNumberController,
                      focusNode: controller.contactNumberFocusNode,
                      isFieldEnabled: controller.isContactNumberEnabled,
                      isAddIconEnabled: controller.isEditingEnabled.value,
                    ),
                    Gap(15.h),
                    InfoTextField.openBottomSheet(
                      hintText: 'Select your gender',
                      labelText: 'Gender',
                      controller: controller.genderController,
                      focusNode: controller.genderFocusNode,
                      isFieldEnabled: controller.isGenderEnabled,
                      onAddIconPressed: () => controller.selectGender(),
                    ),
                    Gap(15.h),
                    InfoTextField.simple( 

                      hintText: 'Enter your age',
                      labelText: 'Age',
                      controller: controller.ageController,
                      focusNode: controller.ageFocusNode,
                      isFieldEnabled: controller.isAgeEnabled,
                      isAddIconEnabled: controller.isEditingEnabled.value,
                    ),
                    Gap(15.h),
                    InfoTextField.openBottomSheet(
                      hintText: 'Enter your date of birth',
                      labelText: 'Date of Birth',
                      controller: controller.dateOfBirthController,
                      focusNode: controller.dateOfBirthFocusNode,
                      isFieldEnabled: controller.isDateOfBirthEnabled,
                      onAddIconPressed: () => controller.selectDateOfBirth(),
                    ),
                    Gap(15.h),
                    InfoTextField.openBottomSheet(
                      hintText: 'Select your marital status',
                      labelText: 'Marital Status',
                      controller: controller.maritalStatusController,
                      focusNode: controller.maritalStatusFocusNode,
                      isFieldEnabled: controller.isMaritalStatusEnabled,
                      onAddIconPressed: () => controller.selectMaritalStatus(),
                    ),
                    Gap(15.h),
                    InfoTextField.simple(
                      hintText: 'Enter your height',
                      labelText: 'Height',
                      controller: controller.heightController,
                      focusNode: controller.heightFocusNode,
                      isFieldEnabled: controller.isHeightEnabled,
                      isAddIconEnabled: controller.isEditingEnabled.value,
                    ),
                    Gap(15.h),
                    InfoTextField.simple(
                      hintText: 'Enter your weight',
                      labelText: 'Weight',
                      controller: controller.weightController,
                      focusNode: controller.weightFocusNode,
                      isFieldEnabled: controller.isWeightEnabled,
                      isAddIconEnabled: controller.isEditingEnabled.value,
                    ),
                    Gap(15.h),
                    InfoTextField.openBottomSheet(
                      hintText: 'Enter your diet type',
                      labelText: 'Diet',
                      controller: controller.dietController,
                      focusNode: controller.dietFocusNode,
                      isFieldEnabled: controller.isDietEnabled,
                      onAddIconPressed: () => controller.selectDiet(),
                    ),
                  ],
                ),
              ),
            )),
        Obx(
          () => _buildProfileImage(
            image: controller.selectedProfileImage.value?.path ?? '',
            isEditingEnabled: controller.isEditingEnabled,
            onEditImagePressed: () => controller.selectProfileImage(),
          ),
        ),
      ],
    );
  }

  Positioned _buildProfileImage({
    required String image,
    required RxBool isEditingEnabled,
    required VoidCallback onEditImagePressed,
  }) {
    return Positioned(
      top: 78.h + 45.h, // height of the appbar + half height of image
      left: 135.w,
      child: Stack(
        children: [
          ShadowBox(
            // padding: EdgeInsets.all(2.r),
            child: image.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Image.file(
                      File(image),
                      width: 90.w,
                      height: 90.w,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(
                    AppConstants.image.avatar,
                    width: 90.w,
                    height: 90.h,
                  ),
          ),
          if (isEditingEnabled.value)
            Positioned(
              bottom: 0.h,
              right: 0.w,
              child: TouchWidget(
                onTap: onEditImagePressed,
                borderRadius: BorderRadius.circular(50.r),
                child: Obx(() => ShadowBox(
                      padding: EdgeInsets.all(10.r),
                      child: isEditingEnabled.value
                          ? Image.asset(
                              AppConstants.image.editDarkPrimary,
                              height: 12.h,
                              width: 12.h,
                            )
                          : SizedBox(),
                      // : Text(
                      //     'Add',
                      //     style: Get.theme.textTheme.labelSmall!
                      //         .copyWith(color: AppColors.secondary),
                      //   ),
                    )),
              ),
            )
        ],
      ),
    );
  }
}
