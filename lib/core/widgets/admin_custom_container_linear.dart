import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/theming/colors/colors.light.dart';
import 'package:store/core/extensions/navigator_extension.dart';


class CustomContainerAdmin extends StatelessWidget {
  const CustomContainerAdmin({this.height,
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

      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      margin: EdgeInsets.all(0),
      width: width ?? double.infinity,
      height: height ?? 170.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
       color: context.color.containerShadow1!.withOpacity(0.8)
       
      ),
      child: child,
    );
  }
}

 