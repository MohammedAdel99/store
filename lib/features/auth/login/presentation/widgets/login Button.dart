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
import 'package:store/features/auth/login/logic/cubit/login_state.dart';
import 'package:store/features/auth/login/data/models/login_request_model.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is Success || current is Error,
        listener: (context, state) {
          state.whenOrNull(
            success: (loginResponse) {
            
              if (context
                  .read<LoginCubit>()
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
                    text: context.translate(LangKeys.loggedSuccessfully) , state: ToastStates.Success);
              }
            },
            error: (error) {
              return fluttertoast(text: context.translate(LangKeys.loggedError), state: ToastStates.Error);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(loading: () {
            return AuthButton(
                onpreesed: () {},
                childButton: CircularProgressIndicator(color:  Colors.white));
          }, orElse: () {
            return AuthButton(
              onpreesed: () {
                validateThenDoLogin(context);
              },
              childButton: TextApp(
                text: context.translate(LangKeys.login),
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

  static void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(
            LoginRequest(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    }
  }
}
