import 'package:flutter/material.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/widgets/app_text_form_feild.dart';




class SignUpTextFormFeilds extends StatelessWidget {
  const SignUpTextFormFeilds({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppTextFormField(hintText: LangKeys.fullName),
        SizedBox(
          height: 20.h,
        ),
        const AppTextFormField(hintText: LangKeys.email),
        SizedBox(
          height: 20.h,
        ),
        const AppTextFormField(hintText: LangKeys.password),
        SizedBox(
          height: 20.h,
        ),
       
      ],
    );
  }
}
