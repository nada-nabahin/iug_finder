import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/styles.dart';

class CustomContainer extends StatelessWidget {
  final String? data;
  final void Function()? onPressed;
  const CustomContainer(
      {super.key, required this.data, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.only(right: 40.w, left: 9.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            data!,
            style: TextStyles.font14BlackMedium,
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: ColorsManager.gray,
              size: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}
