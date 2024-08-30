import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/theming/colors/colors_dark.dart';
import 'package:store/core/extensions/navigator_extension.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contrntPadding;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;
  final String hintText;
  final TextStyle? hintStyle;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextInputType keyboardType;
  final int? maxLines;
  
  const AppTextFormField({
    Key? key,
    this.controller,
    this.contrntPadding,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    required this.hintText,
    this.hintStyle,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.validator,
    this.onChanged,
     required this.keyboardType,
    this.maxLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      
      controller: controller,
      maxLines: maxLines??1,
      onChanged: onChanged?? (value){},
      
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contrntPadding ??
            EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
        focusedBorder: 
            OutlineInputBorder(
                borderSide: BorderSide(
                  color: focusedBorderColor ?? mainBlue,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.r)),
        enabledBorder: 
            OutlineInputBorder(
                borderSide:BorderSide(
                  color: enabledBorderColor ?? Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.r)),
        errorBorder: 
            OutlineInputBorder(
                borderSide:  BorderSide(
                  color: errorBorderColor??Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.r)),
        focusedErrorBorder: 
            OutlineInputBorder(
                borderSide: BorderSide(
                  color: focusedErrorBorderColor??Colors.red,
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