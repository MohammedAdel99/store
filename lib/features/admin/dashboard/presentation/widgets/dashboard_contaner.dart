import 'package:flutter/material.dart';
import 'package:store/core/theming/styles.dart';
import 'package:store/core/widgets/shimmer.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/widgets/admin_custom_container_linear.dart';



class DashboardContainer extends StatelessWidget {

  const DashboardContainer({
    super.key,
    required this.title,
    required this.number,
    required this.image,
    required this.isLoading,
  });
  final String title;
  final int number;
  final String image;
  final bool isLoading;

   @override
   Widget build(BuildContext context) {
       return
          
        
          CustomContainerAdmin(
            height: 150.h,
             width: double.infinity,
              child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical :15.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                  Column(
                    children: [
                      TextApp(text: context.translate(title), theme: TextStyles.font24BoldWhite.copyWith(color: context.color.textColor)),
                      SizedBox(height: 15.h,),
                      if(isLoading)
                      LoadingShimmer(height: 30.h,width: 100.w,)
                      else
                      TextApp(text: number.toString(), theme:  TextStyles.font24BoldWhite.copyWith(color: context.color.textColor) )
                    ],
                  ),
                  Image.asset(image ,height: 120.h,width:70.w)
                ],)
                )
        
       );
  }
}
