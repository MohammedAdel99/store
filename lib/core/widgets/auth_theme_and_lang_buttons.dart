import 'package:flutter/material.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/animations/animate_do.dart';
import 'package:store/core/widgets/app_linear_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';

class AuthThemeAndLangButtons extends StatelessWidget {
  const AuthThemeAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children:[
                      CustomFadeInRight(
                        duration: 400,
                        child: LinearButton(onPressed: (){}, child: const Icon(Icons.light_mode_rounded ,color: Colors.white,))),
                      const Spacer(),
                      CustomFadeInLeft(
                        duration: 400,
                        child: LinearButton(onPressed: (){},width: 100.w, child: TextApp( text: 'العربية', theme: context.textStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold) ,),
                        ),
                      ),
                  
                    ],),
                      SizedBox(

                  height: 30.h,

                ),
                  
      ],
    );
  }
}
