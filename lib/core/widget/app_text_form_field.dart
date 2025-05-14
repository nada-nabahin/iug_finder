import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.keyboardType,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.w,
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsManager.lightBlue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsManager.white,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
          hintStyle: hintStyle ?? TextStyles.font14BlackMedium,
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: backgroundColor ?? ColorsManager.white,
          filled: true,
        ),
        obscureText: isObscureText ?? false,
        style: TextStyles.font14BlackMedium,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
      ),
    );
  }
}
