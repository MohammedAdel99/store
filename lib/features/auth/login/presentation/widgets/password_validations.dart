// import 'package:flutter/material.dart';
// import 'package:store/core/theming/styles.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:store/core/extensions/navigator_extension.dart';

// class PasswordValidations extends StatelessWidget {
//   const PasswordValidations({
    
//     required this.hasLowerCase,
//     required this.hasUpperCase,
//     required this.hasSpecialCharacters,
//     required this.hasNumber,
//     required this.hasMinLength,
//   });
//   final bool hasLowerCase;
//   final bool hasUpperCase;
//   final bool hasSpecialCharacters;
//   final bool hasNumber;
//   final bool hasMinLength;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         buildValidationRow('At least 1 lowercase letter', hasLowerCase),
//         SizedBox(height: 2.h),
//         buildValidationRow('At least 1 uppercase letter', hasUpperCase),
//         SizedBox(height: 2.h),
//         buildValidationRow(
//             'At least 1 special character', hasSpecialCharacters),
//         SizedBox(height: 2.h),
//         buildValidationRow('At least 1 number', hasNumber),
//         SizedBox(height: 2.h),
//         buildValidationRow('At least 8 characters long', hasMinLength),
//       ],
//     );
//   }

//   Widget buildValidationRow(String text, bool hasValidated) {
//     return Row(
//       children: [
//         const CircleAvatar(
//           radius: 2.5,
//           backgroundColor:Colors.yellow,
//         ),
//         SizedBox(width: 6.h),
//         Text(
//           text,
//           style: TextStyles.font13DarkBlueRegular.copyWith(
//             decoration: hasValidated ? TextDecoration.lineThrough : null,
//             decorationColor: Colors.green,
//             decorationThickness: 2,
//             color: hasValidated ? Colors.grey : Colors.blue,
//           ),
//         ),
//       ],

//     );
//   }
// }
