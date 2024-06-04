import 'package:flutter/material.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/widgets/app_text_form_feild.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/widgets/auth_have_account_or_not.dart';
import 'package:store/core/widgets/auth_login_signup_button.dart';

class SignUpTextFormFeilds extends StatelessWidget {
  const SignUpTextFormFeilds({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppTextFormField(hintText: LangKeys.fullName),
        SizedBox(
          height: 25.h,
        ),
        const AppTextFormField(hintText: LangKeys.email),
        SizedBox(
          height: 25.h,
        ),
        const AppTextFormField(hintText: LangKeys.password),
        SizedBox(
          height: 30.h,
        ),
       
      ],
    );
  }
}
