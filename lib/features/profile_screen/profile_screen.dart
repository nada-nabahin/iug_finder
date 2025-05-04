import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/extension.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/routing/routers.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/widget/app_text_button.dart';

import '../../core/theming/styles.dart';
import 'widget/custom_container_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [ColorsManager.mainBlue, ColorsManager.lightBlue],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 20.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/student.png',
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),
                verticalSpace(15.h),
                Text(
                  'محمد علاء أحمد البريم',
                  style: TextStyles.font18WightSemiBold,
                ),
                verticalSpace(16.h),
                Text(
                  '220205090',
                  style: TextStyles.font18WightSemiBold,
                ),
                verticalSpace(25.h),
                CustomContainer(
                  data: "تعديل  البيانات الشخصية",
                  onPressed: () {
                    context.pushNamed(Routers.editProfileScreen);
                  },
                ),
                verticalSpace(25.h),
                CustomContainer(
                  data: "الاشعارات",
                  onPressed: () {
                    context.pushNamed(Routers.notificationScreen);
                  },
                ),
                verticalSpace(25.h),
                CustomContainer(
                  data: "بلاغاتي",
                  onPressed: () {
                    context.pushNamed(Routers.contactUsScreen);
                  },
                ),
                Spacer(),
                AppTextButton(
                  buttonText: 'تسجيل الخروج',
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
