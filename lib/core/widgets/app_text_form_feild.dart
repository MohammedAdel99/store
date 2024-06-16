import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/extensions/navigator_extension.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contrntPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final String hintText;
  final TextStyle? hintStyle;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  
  const AppTextFormField({
    Key? key,
    this.controller,
    this.contrntPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    required this.hintText,
    this.hintStyle,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contrntPadding ??
            EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.color.textFormBorder!,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.r)),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderSide:BorderSide(
                  color: context.color.textFormBorder!,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.r)),
        errorBorder: errorBorder ??
            OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.r)),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.r)),
        hintText: context.translate(hintText),
        hintStyle: hintStyle ?? context.textStyle.copyWith(
              color: context.color.textColor,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp),
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? context.color.mainColor,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyle(
        color: context.color.textColor,
        fontSize: 16.sp,
      ),
      validator: (value) {
        return validator!(value);
      },
    );
  }
}