import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/extenstion.dart';
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
        child: Directionality(
          textDirection: TextDirection.rtl,
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
                vertical: 50.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/student.png',
                      width: 225.h,
                      height: 225.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  verticalSpace(20.h),
                  Text(
                    'محمد علاء أحمد البريم',
                    style: TextStyles.font18WightSemiBold,
                  ),
                  verticalSpace(16.h),
                  Text(
                    '220205090',
                    style: TextStyles.font18WightSemiBold,
                  ),
                  verticalSpace(40.h),
                  CustomContainer(
                    data: "تعديل  البيانات الشخصية",
                    onPressed: () {
                      context.pushNamed(Routers.editProfileScreen);
                    },
                  ),
                  verticalSpace(40.h),
                  CustomContainer(
                    data: "الاشعارات",
                    onPressed: () {
                      //  Navigator
                      context.pushNamed(Routers.notificationScreen);
                    },
                  ),
                  verticalSpace(40.h),
                  CustomContainer(
                    data: "بلاغاتي",
                    onPressed: () {
                      //  Navigator
                      context.pushNamed(Routers.contactUsScreen);
                    },
                  ),
                  Spacer(),
                  AppTextButton(
                    buttonText: 'تسجيل خروج',
                    buttonWidth: 300,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
