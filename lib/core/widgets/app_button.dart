import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';



class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.child,
    this.height,
    this.width,
    this.color,
    super.key,  this.borderRadius,
  });
  final VoidCallback onPressed;
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 50.h,
        width: width ?? 44.w,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.r) 
          ),
          color: color ?? mainBlue,
        ),
        child: Center(child: child),
      ),
    );
  }
}
