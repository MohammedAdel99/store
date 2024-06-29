import 'package:flutter/material.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/widgets/app_button.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';

class GetAllCategoriesText extends StatelessWidget {
  const GetAllCategoriesText({super.key});

  @override
  Widget build(BuildContext context) {
    return  
    
          
          Column(
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextApp(text:context.translate(LangKeys.allCategories), theme:TextStyles.font20BoldWhite.copyWith(color: mainBlue, )),
                  AppButton(width: 60.w, onPressed: (){}, child: TextApp(text:context.translate(LangKeys.add),theme: TextStyles.font17BoldWhite,
              ))],
              
                      
                    
                  ),
                  SizedBox(height: 15.h,),
            ],
          );
  }
}