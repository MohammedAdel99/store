import 'package:flutter/material.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/widgets/auth_title.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/widgets/app_custom_painter.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/widgets/auth_have_account_or_not.dart';
import 'package:store/core/widgets/auth_login_signup_button.dart';
import 'package:store/core/widgets/auth_theme_and_lang_buttons.dart';
import 'package:store/features/auth/login/presentation/widgets/login_textformfeilds.dart';












class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(

          padding: EdgeInsets.symmetric(
            horizontal: 20.w, 
            vertical:20.h
            ), 
               
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
    );
  }
}
