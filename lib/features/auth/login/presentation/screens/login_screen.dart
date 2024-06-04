import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:store/core/widgets/app_text.dart';
=======
>>>>>>> Stashed changes
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/widgets/auth_title.dart';
import 'package:store/core/animations/animate_do.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/widgets/app_linear_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/widgets/app_custom_painter.dart';
import 'package:store/core/widgets/app_text_form_feild.dart';
import 'package:store/core/extensions/navigator_extension.dart';
<<<<<<< Updated upstream
import 'package:store/core/helpers/fonts/font_weight_helper.dart';
=======
import 'package:store/core/widgets/auth_have_account_or_not.dart';
import 'package:store/core/widgets/auth_login_signup_button.dart';
import 'package:store/core/widgets/auth_theme_and_lang_buttons.dart';
import 'package:store/features/auth/login/presentation/widgets/login_textformfeilds.dart';

>>>>>>> Stashed changes
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(
          double.infinity,
          120.h,
        ),
        painter: AppCustomPainter(
          gradient: LinearGradient(
            colors: [
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
            ],
          ),
        ),),
      body: SafeArea(
        bottom:false,
        child: Padding(
<<<<<<< Updated upstream
          padding: EdgeInsets.symmetric(
            horizontal: 20.w, 
            vertical:20.h
            ),child: SingleChildScrollView(
              child: Column(children: [
                Row(children:[
                  CustomFadeInRight(
                    duration: 400,
                    child: LinearButton(onPressed: (){}, child: const Icon(Icons.light_mode_rounded ,color: Colors.white,))),
                  const Spacer(),
                  CustomFadeInLeft(
                    duration: 400,
                    child: LinearButton(onPressed: (){},width: 100.w, child: TextApp( text: 'العربية', theme: context.textStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold) ,)
                    ),
                  ),
              
                ],),
                SizedBox(height: 50.h,),
                AuthTitle(title: context.translate(LangKeys.login), description: context.translate(LangKeys.welcome)),
                SizedBox(height: 35.h),
                AppTextFormField(hintText:context.translate(LangKeys.email)),
                SizedBox(height: 25.h,),
                AppTextFormField(hintText:context.translate(LangKeys.password)),
                SizedBox(height: 30.h,),
                CustomFadeInRight(duration: 600 ,child: LinearButton(onPressed: (){ context.pushReplacementNamed(AppRoutes.signup);},width: double.infinity.w,height: 60.h, child: TextApp(text: context.translate(LangKeys.login) ,theme: context.textStyle.copyWith(fontSize:18.sp, fontWeight: FontWeightHelper.bold) ,))),
                const SizedBox(height: 40,),
                TextApp(text: context.translate(LangKeys.createAccount), theme: context.textStyle.copyWith(fontSize : 14.sp,fontWeight: FontWeightHelper.bold, color:context.color.bluePinkLight))
                
              ]),
            ),),),
=======
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AuthThemeAndLangButtons(),
                const AuthTitle(
                  title: LangKeys.login,
                  description: LangKeys.welcome,
                ),
                const LoginTextFormFeilds(),
                const AuthButton(Textbutton: LangKeys.login),
                AuthHaveAccountOrNot(
                    onpressed: () {
                      context.pushReplacementNamed(AppRoutes.signup);
                    },
                    text: LangKeys.createAccount),
              ],
            ),
          ),
        ),
      ),
>>>>>>> Stashed changes
    );
  }
}
