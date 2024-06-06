import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/animations/animate_do.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/widgets/app_linear_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/localization/app_localizations.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/networking/app_cubit/app_cubit.dart';

class AuthThemeAndLangButtons extends StatelessWidget {
  const AuthThemeAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Column(
      children: [
        Row(
          children: [
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                return CustomFadeInRight(
                    duration: 400,
                    child: LinearButton(
                        onPressed: cubit.changeAppThemeMode,
                        child: Icon(
                          cubit.isDark
                              ? Icons.light_mode_rounded
                              : Icons.dark_mode_rounded,
                          color: Colors.white,
                        )));
              },
            ),
            const Spacer(),
            CustomFadeInLeft(
              duration: 400,
              child: LinearButton(
                onPressed: () {
                  if (AppLocalizations.of(context)!.isEnLocale) {
                    cubit.toArabic();
                  }
                  else{
                    cubit.toEnglish();
                  }
                },
                width: 100.w,
                child: TextApp(
                  text: context.translate(LangKeys.language),
                  theme: context.textStyle
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
      ],
    );
  }
}
