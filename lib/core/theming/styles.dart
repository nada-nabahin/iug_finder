import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/font_weight_helper.dart';

class TextStyles {
  //!
  static TextStyle font18WightSemiBold = GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.white,
  );
  //!
  static TextStyle font14BlackMedium = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.black,
  );
  //!
  static TextStyle font14BlackSemiBold = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.black,
  );
  static TextStyle font15BlackRegular = GoogleFonts.inter(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.cyan,
  );

  static TextStyle font16WightMedium = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.white,
  );
}
