import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/features/home/widget/category_report_lits.dart';
import 'package:iug_finder/features/home/widget/home_top_bar.dart';
import 'package:iug_finder/features/home/widget/reports_blue_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 28.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeTopBar(),
                const DoctorsBlueContainer(),
                verticalSpace(24),
                Text(
                  "انواع المفقودات",
                  style: TextStyles.font18DarkBlueBold,
                ),
                verticalSpace(16),
                const CategoryListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
