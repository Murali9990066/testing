import 'package:e_medfile/widgets/textfields/info_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MedicalTabView extends StatelessWidget {
  const MedicalTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final foodAllergiesController = TextEditingController();
    final drugAllergiesController = TextEditingController();
    final bloodGroupController = TextEditingController();
    final implantsController = TextEditingController();
    final surgeriesController = TextEditingController();
    final familyMedicalHistoryController = TextEditingController();

    final foodAllergiesFocusNode = FocusNode();
    final drugAllergiesFocusNode = FocusNode();
    final bloodGroupFocusNode = FocusNode();
    final implantsFocusNode = FocusNode();
    final surgeriesFocusNode = FocusNode();
    final familyMedicalHistoryFocusNode = FocusNode();

    RxBool isFoodAllergiesEnabled = false.obs;
    RxBool isDrugAllergiesEnabled = false.obs;
    RxBool isBloodGroupEnabled = false.obs;
    RxBool isImplantsEnabled = false.obs;
    RxBool isSurgeriesEnabled = false.obs;
    RxBool isFamilyMedicalHistoryEnabled = false.obs;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            InfoTextField.simple(
              hintText: 'Enter food allergies',
              labelText: 'Food allergies',
              controller: foodAllergiesController,
              focusNode: foodAllergiesFocusNode,
              isFieldEnabled: isFoodAllergiesEnabled,
            ),
            Gap(15.h),
            InfoTextField.simple(
              hintText: 'Enter drug allergies',
              labelText: 'Drug allergies',
              controller: drugAllergiesController,
              focusNode: drugAllergiesFocusNode,
              isFieldEnabled: isDrugAllergiesEnabled,
            ),
            Gap(15.h),

            InfoTextField.simple(
              hintText: 'Enter blood group',
              labelText: 'Blood group',
              controller: bloodGroupController,
              focusNode: bloodGroupFocusNode,
              isFieldEnabled: isBloodGroupEnabled,
            ),
            Gap(15.h),
            InfoTextField.simple(
              hintText: 'Enter implants',
              labelText: 'Implants',
              controller: implantsController,
              focusNode: implantsFocusNode,
              isFieldEnabled: isImplantsEnabled,
            ),
            Gap(15.h),
            InfoTextField.simple(
              hintText: 'Enter surgeries',
              labelText: 'Surgeries',
              controller: surgeriesController,
              focusNode: surgeriesFocusNode,
              isFieldEnabled: isSurgeriesEnabled,
            ),
            Gap(15.h),
            InfoTextField.simple(
              hintText: 'Enter family medical history',
              labelText: 'Family medical history',
              controller: familyMedicalHistoryController,
              focusNode: familyMedicalHistoryFocusNode,
              isFieldEnabled: isFamilyMedicalHistoryEnabled,
            ),

            // other fields
          ],
        ),
      ),
    );
  }
}
