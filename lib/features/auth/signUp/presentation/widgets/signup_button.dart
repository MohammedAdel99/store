import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/widgets/app_toast.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/helpers/fonts/font_weight_helper.dart';
import 'package:store/core/widgets/auth_login_signup_button.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_keys.dart';
import 'package:store/core/helpers/shared_pref/shared_pref_helper.dart';
import 'package:store/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:store/features/auth/signUp/logic/cubit/signup_cubit.dart';
import 'package:store/features/auth/signUp/logic/cubit/signup_state.dart';
import 'package:store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:store/features/auth/login/data/models/login_request_model.dart';
import 'package:store/features/auth/signUp/data/models/signup_request_model.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
        listenWhen: (previous, current) =>
            current is Success || current is Error,
        listener: (context, state) {
          state.whenOrNull(
            success: (signupResponse) {
              context.read<LoginCubit>().emitLoginState(
                    LoginRequest(
                      email: context.read<SignupCubit>().emailController.text,
                      password:
                          context.read<SignupCubit>().passwordController.text,
                    ),
                  );

              if (context
                  .read<SignupCubit>()
                  .emailController
                  .text
                  .contains('admin')) {
                SharedPref.setString(SharedPrefKeys.userRole, 'admin');
                context.pushReplacementNamed(AppRoutes.admin);
              } else {
                SharedPref.setString(SharedPrefKeys.userRole, 'customer');
                context.pushReplacementNamed(AppRoutes.customer);
                // if (userRole == 'admin') {
                //   context.pushReplacementNamed(AppRoutes.admin);
                // } else if (userRole == 'customer') {
                //   context.pushReplacementNamed(AppRoutes.customer);
                // } else {
                //   return null;
                // }

                return fluttertoast(
                    text: context.translate(LangKeys.signUpSuccessfully), state: ToastStates.Success);
              }
            },
            error: (error) {
              return fluttertoast(text: context.translate(LangKeys.signUpError), state: ToastStates.Error);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(loading: () {
            return AuthButton(
                onpreesed: () {},
                childButton: CircularProgressIndicator(color: Colors.white));
          }, orElse: () {
            return AuthButton(
              onpreesed: () {
                validateThenDoSignup(context);
              },
              childButton: TextApp(
                text: context.translate(LangKeys.signUp),
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.bold,
                  color:  Colors.white,
                ),
              ),
            );
          });
        });
  }

  static void validateThenDoSignup(BuildContext context) {
    if (!context.read<SignupCubit>().formKey.currentState!.validate() ||  context.read<UploadImageCubit>().getImageUrl.isEmpty) {
        if(context.read<UploadImageCubit>().getImageUrl.isEmpty){
          return fluttertoast(text:context.translate( LangKeys.validPickImage), state: ToastStates.Error);
        }
      }else {
      context.read<SignupCubit>().imageUrl =
          context.read<UploadImageCubit>().getImageUrl;
     
      context.read<SignupCubit>().emitSignupStates(SignUpRequest()
          // context.read<LoginCubit>().emitLoginState(
          //       LoginRequest(
          //         email: context.read<SignupCubit>().emailController.text,
          //         password: context.read<SignupCubit>().passwordController.text,
          //       ),
          );
    }
  }
}
