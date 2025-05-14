import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final PreferredSizeWidget? bottom;
  List<Widget>? actions;
  AppAppBar({super.key, required this.title, this.bottom, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Remove the back arrow icon
      flexibleSpace: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 20.h),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorsManager.mainBlue, ColorsManager.lightBlue],
          ),
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: Text(title!, style: TextStyles.font18WightSemiBold),
        ),
      ),
      bottom: bottom,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h); // Set the preferred size
}
