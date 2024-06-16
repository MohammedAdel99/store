import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/app_regex.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/widgets/app_text_form_feild.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:store/features/auth/login/presentation/widgets/password_validations.dart';

class LoginTextFormFeilds extends StatefulWidget {
  const LoginTextFormFeilds({super.key});

  @override
  State<LoginTextFormFeilds> createState() => _LoginTextFormFeildsState();
}

class _LoginTextFormFeildsState extends State<LoginTextFormFeilds> {
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: LangKeys.email,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextFormField(
              hintText: LangKeys.password,
              controller: context.read<LoginCubit>().passwordController,
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,color: context.color.textColor,
                ),
              ),
              validator: (value) {
               
                 if (hasLowercase == false) {
                  return 'Please enter  password has lowercase';
                } else if (hasUppercase == false) {
                  return 'Please enter  password has uppercase';
                } else if (hasNumber == false) {
                  return 'Please enter  password has Number';
                }
                //  else if (hasSpecialCharacters == false) {
                //   return 'Please enter  password has SpecialCharacters';
                // }
                 else if (hasLowercase == false) {
                  return 'Please enter  password MinLength > 8 ';
                } else if(value == null || value.isEmpty)  {
                  return 'Please enter a valid password';
                }
                
              }),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
    @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
