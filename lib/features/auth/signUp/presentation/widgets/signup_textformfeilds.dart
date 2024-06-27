import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/app_regex.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/widgets/app_text_form_feild.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/features/auth/signUp/logic/cubit/signup_cubit.dart';

class SignUpTextFormFeilds extends StatefulWidget {
  const SignUpTextFormFeilds({super.key});

  @override
  State<SignUpTextFormFeilds> createState() => _SignUpTextFormFeildsState();
}

class _SignUpTextFormFeildsState extends State<SignUpTextFormFeilds> {
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
    passwordController = context.read<SignupCubit>().passwordController;
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
    return  Form(
      key: context.read<SignupCubit>().formKey,
     child: Column(
      children: [
        AppTextFormField(
          hintText: LangKeys.fullName,
          validator: (value) {
            if (value == null ||
                value.isEmpty 
            ){
              return context.translate(LangKeys.nameValidation);
            }
          },
          controller: context.read<SignupCubit>().nameController,
        ),
        SizedBox(
          height: 20.h,
        ),
        AppTextFormField(hintText: LangKeys.email,
        validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return context.translate(LangKeys.emailValidation);
              }
            },
            controller: context.read<SignupCubit>().emailController,
        ),
        SizedBox(
          height: 25.h,
        ),
        AppTextFormField(
            hintText: LangKeys.password,
            controller: context.read<SignupCubit>().passwordController,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: context.color.textColor,
              ),
            ),
            validator: (value) {
               if (hasLowercase == false) {
                return context.translate(LangKeys.passwordValidationLowercase);
              } else if (hasUppercase == false) {
                return context.translate(LangKeys.passwordValidationUppercase);
              } else if (hasNumber == false) {
                return context.translate(LangKeys.passwordValidationNumber);
              }
              else if (hasMinLength == false) {
                return context.translate(LangKeys.passwordValidationLength);
              } else if (value == null || value.isEmpty) {
                return context.translate(LangKeys.passwordValidationEmpty);
              }
            }),
        SizedBox(
          height: 30.h,
        ),
      ],
    ));
  }
    @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
