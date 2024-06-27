import 'package:flutter/material.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/helpers/fonts/font_weight_helper.dart';



class AuthHaveAccountOrNot extends StatelessWidget {
  const AuthHaveAccountOrNot({
    required this.onpressed, required this.text, super.key,
  });
  final VoidCallback onpressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpressed,
        child: TextApp(
          text: context.translate(text),
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.bold,
            color: context.color.bluePinkDark,
          ),
        ),);
  }
}
