import 'package:flutter/material.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/app_button.dart';
import 'package:store/core/animations/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/helpers/fonts/font_weight_helper.dart';


class AuthButton extends StatelessWidget {
  final Widget childButton;
  final void Function() onpreesed;
  const AuthButton({
    Key? key,
    required this.childButton,
    required this.onpreesed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFadeInRight(
          duration: 600,
          child: AppButton(
            onPressed:onpreesed,
            width: double.infinity.w,
            height: 60.h,
            child:childButton
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
