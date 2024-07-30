import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';



class ContainerAdmin extends StatelessWidget {
  const ContainerAdmin({this.height,
    this.width,
    required this.child,
    super.key,
  });

  final double? height;
  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      

      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      
      width: width ?? double.infinity,
      height: height ?? 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
       color: context.color.containerShadow1!.withOpacity(0.8),
       
       
      ),
      child: child,
    );
  }
}

 