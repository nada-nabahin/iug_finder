import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/styles.dart';

class ContactInfoCard extends StatelessWidget {
  final String label; // Label (e.g., "رقم الهاتف")
  final String value; // Value (e.g., "0599999999")
  final String
      iconPath; // Path to the icon asset (e.g., "assets/images/phone.png")

  const ContactInfoCard({
    super.key,
    required this.label,
    required this.value,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorsManager.cyan),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorsManager.cyan, // Border color
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                iconPath,
                width: 20.w,
                height: 15.h,
              ),
            ),
          ),
          horizontalSpace(20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyles.font15BlackRegular,
                ),
                Text(
                  value,
                  style: TextStyles.font15BlackRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
