import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/theming/colors.dart';

import '../../../../../core/theming/styles.dart';

class CategoryListViewItem extends StatelessWidget {
  // final SpecializationsData? specializationsData;
  final int itemIndex;
  const CategoryListViewItem({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: ColorsManager.lightBlue,
            child: Image.asset(
              'assets/images/location.png',
              height: 48.h,
              width: 48.w,
            ),
          ),
          verticalSpace(8),
          Text("Category $itemIndex", style: TextStyles.font12DarkBlueRegular),
        ],
      ),
    );
  }
}
