import 'package:flutter/material.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/app_linear_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/helpers/fonts/font_family_helper.dart';
import 'package:store/core/helpers/fonts/font_weight_helper.dart';


class CustomDialog {
  const CustomDialog._();

  static void twoButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton1,
    required String textButton2,
    required void Function() onPressed,
    required bool isLoading,
  }) {
    showDialog<dynamic>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey,
        title: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 20.h,
          ),
          child: Center(
            child: TextApp(
              text: textBody,
              theme: context.textStyle.copyWith(
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontSize: 18.sp,
                color: Colors.black,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: [
          LinearButton(
         
            onPressed: onPressed,
            child:Text( textButton1),
            width: 320.w,
            height: 45.h,
           
          ),
          SizedBox(height: 10.h, width: 1.w),
          LinearButton(
            onPressed: () {
              context.pop();
            },
            child:Text( textButton2),
            width: 320.w,
            height: 45.h,
            
          ),
        ],
      ),
    );
  }
}
