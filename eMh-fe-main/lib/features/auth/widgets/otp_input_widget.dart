// import 'package:e_medfile/features/auth/controllers/otp_input_controller.dart';
// import 'package:e_medfile/theme/color_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';

// class OTPInputWidget extends StatelessWidget {
//   final OTPInputController controller;
//   final int length;
//   final TextStyle? textStyle;
//   final BorderRadius? borderRadius;
//   final BorderSide borderSide;
//   final Size fieldSize;

//   OTPInputWidget({
//     required this.controller,
//     required this.length,
//     this.textStyle,
//     this.borderRadius,
//     this.borderSide = const BorderSide(width: 1, color: AppColors.greyFadedBorder),
//     this.fieldSize = const Size(45, 45),
//   }) {
//     controller.initOTP(length);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: fieldSize.height,
//       width: fieldSize.width * length,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: length,
//         shrinkWrap: true,
//         separatorBuilder: (_, __ ) => Gap(9.2.w),
//         itemBuilder: (context, index) {
//           return Container(
//             width: fieldSize.width,
//             height: fieldSize.height,
//             child: TextFormField(
//               textAlign: TextAlign.center,
//               keyboardType: TextInputType.number,
//               maxLength: 1,
//               style: textStyle ?? Get.theme.textTheme.bodyLarge,
//               decoration: InputDecoration(
//                 counter: Offstage(),
//                 fillColor: Colors.white,
//                 filled: true,
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: borderSide,
//                   borderRadius: BorderRadius.circular(fieldSize.height / 2),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: borderSide.copyWith(color: Colors.blue),
//                   borderRadius: BorderRadius.circular(fieldSize.height / 2),
//                 ),
//                 contentPadding: EdgeInsets.symmetric(vertical: fieldSize.height * 0.25),
//               ),
//               showCursor: false,
//               textAlignVertical: TextAlignVertical.center,
//               onChanged: (value) {
//                 if (value.isNotEmpty) {
//                   controller.setOTP(index, value);
//                   if (index < length - 1) {
//                     FocusScope.of(context).nextFocus();
//                   } else {
//                     FocusScope.of(context).unfocus();
//                   }
//                 } else if (value.isEmpty && index > 0) {
//                   controller.setOTP(index, '');
//                   FocusScope.of(context).previousFocus();
//                 }
//               },
//               onTap: () {
//                 if (controller.getOTP()[index].isNotEmpty) {
//                   controller.setOTP(index, '');
//                 }
//                 // Move the cursor to the end of the text
//                 final textLength = controller.getOTP()[index].length;
//                 (context as Element).markNeedsBuild();
//                 Future.delayed(Duration.zero, () {
//                   (context.widget as TextFormField).controller?.selection = TextSelection.fromPosition(
//                     TextPosition(offset: textLength),
//                   );
//                 });
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
