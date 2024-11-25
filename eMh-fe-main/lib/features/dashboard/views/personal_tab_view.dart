import 'package:e_medfile/features/dashboard/controllers/dashboard_controller.dart';
import 'package:e_medfile/widgets/textfields/info_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PersonalTabView extends StatelessWidget {
  const PersonalTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            InfoTextField.simple(
              hintText: 'Enter your name',
              labelText: 'Name',
              controller: controller.nameController,
              focusNode: controller.nameFocusNode,
              isFieldEnabled: controller.isPersonalTabViewFieldsEnabled,
              isAddIconEnabled: controller.isPersonalTabViewFieldsEnabled.value,
            ),
            Gap(15.h),
            InfoTextField.simple(
              hintText: 'Enter your email',
              labelText: 'Email',
              controller: controller.emailController,
              focusNode: controller.emailFocusNode,
              isFieldEnabled: controller.isPersonalTabViewFieldsEnabled,
              isAddIconEnabled: controller.isPersonalTabViewFieldsEnabled.value,
            ),
            Gap(15.h),

            InfoTextField.simple(
              hintText: 'Enter your contact number',
              labelText: 'Contact Number',
              controller: controller.contactNumberController,
              focusNode: controller.contactNumberFocusNode,
              isFieldEnabled: controller.isPersonalTabViewFieldsEnabled,
              isAddIconEnabled: controller.isPersonalTabViewFieldsEnabled.value,
            ),
            Gap(15.h),
            InfoTextField.openBottomSheet(
              hintText: 'Enter your gender',
              labelText: 'Gender',
              controller: controller.genderController,
              focusNode: controller.genderFocusNode,
              isFieldEnabled: controller.isPersonalTabViewFieldsEnabled,
              isAddIconEnabled: controller.isPersonalTabViewFieldsEnabled.value,
              onAddIconPressed: () => controller.selectGender(),
            ),
            Gap(15.h),
            InfoTextField.simple(
              hintText: 'Enter your age',
              labelText: 'Age',
              controller: controller.ageController,
              focusNode: controller.ageFocusNode,
              isFieldEnabled: controller.isPersonalTabViewFieldsEnabled,
              isAddIconEnabled: controller.isPersonalTabViewFieldsEnabled.value,
            ),
            Gap(15.h),
            InfoTextField.openBottomSheet(
              hintText: 'Enter your date of birth',
              labelText: 'Date of birth',
              controller: controller.dateOfBirthController,
              focusNode: controller.dateOfBirthFocusNode,
              isFieldEnabled: controller.isPersonalTabViewFieldsEnabled,
              isAddIconEnabled: controller.isPersonalTabViewFieldsEnabled.value,
              onAddIconPressed: () => controller.selectDateOfBirth(),
            ),
            Gap(15.h),
            InfoTextField.openBottomSheet(
              hintText: 'Enter your marital status',
              labelText: 'Marital Status',
              controller: controller.maritalStatusController,
              focusNode: controller.maritalStatusFocusNode,
              isFieldEnabled: controller.isPersonalTabViewFieldsEnabled,
              isAddIconEnabled: controller.isPersonalTabViewFieldsEnabled.value,
              onAddIconPressed: () => controller.selectMaritalStatus(),
            ),
            Gap(15.h),
            InfoTextField.simple(
              hintText: 'Enter your height',
              labelText: 'Height',
              controller: controller.heightController,
              focusNode: controller.heightFocusNode,
              isFieldEnabled: controller.isPersonalTabViewFieldsEnabled,
              isAddIconEnabled: controller.isPersonalTabViewFieldsEnabled.value,
            ),
            Gap(15.h),
            InfoTextField.simple(
              hintText: 'Enter your weight',
              labelText: 'Weight',
              controller: controller.weightController,
              focusNode: controller.weightFocusNode,
              isFieldEnabled: controller.isPersonalTabViewFieldsEnabled,
              isAddIconEnabled: controller.isPersonalTabViewFieldsEnabled.value,
            ),
            Gap(15.h),
            InfoTextField.openBottomSheet(
              hintText: 'Enter your diet',
              labelText: 'Diet',
              controller: controller.dietController,
              focusNode: controller.dietFocusNode,
              isFieldEnabled: controller.isPersonalTabViewFieldsEnabled,
              isAddIconEnabled: controller.isPersonalTabViewFieldsEnabled.value,
              onAddIconPressed: () => controller.selectDiet(),
            ),

            // other fields
          ],
        ),
      ),
    );
  }
}
