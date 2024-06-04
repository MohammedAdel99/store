import 'package:flutter/material.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/widgets/app_text_form_feild.dart';



class LoginTextFormFeilds extends StatelessWidget {
  const LoginTextFormFeilds({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppTextFormField(hintText:LangKeys.email),
                SizedBox(height: 20.h,),
                AppTextFormField(hintText:LangKeys.password ),
                SizedBox(height: 25.h,),

                


    ],);
  }
}
