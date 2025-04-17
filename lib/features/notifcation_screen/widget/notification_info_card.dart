import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/theming/styles.dart';
import '../../../core/theming/colors.dart';

class NotificationInfoCard extends StatelessWidget {
  final String label;
  final String value;
  final String iconPath;
  const NotificationInfoCard({
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
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorsManager.cyan),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              iconPath,
              width: 55.w,
              height: 55.h,
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyles.font15BlackRegular,
                  maxLines: 1,
                ),
                Text(
                  value,
                  maxLines: 2,
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
