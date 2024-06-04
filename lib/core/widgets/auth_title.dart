import 'package:flutter/material.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/animations/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/helpers/fonts/font_weight_helper.dart';


class AuthTitle extends StatelessWidget {
  const AuthTitle({
    required this.title, required this.description, super.key,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          TextApp(
            text: title,
            theme: context.textStyle
                .copyWith(fontSize: 24.sp, fontWeight: FontWeightHelper.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          TextApp(
            text: description,
            theme: context.textStyle.copyWith(fontSize: 16.sp,fontWeight: FontWeightHelper.regular),
            textAlign: TextAlign.center,
          ),
<<<<<<< Updated upstream
=======
          SizedBox(height: 15.h),
>>>>>>> Stashed changes
        ],
        
      ),
    );
  }
}
