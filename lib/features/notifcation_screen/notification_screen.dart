import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/widget/app_app_bar.dart';

import 'widget/notification_info_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppAppBar(
          title: 'الإشعارات',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 10.h),
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                itemCount: 1, // list.length (api)
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: const NotificationInfoCard(
                      label: 'يرجى منك تسليم الغرض لموظف الامانات في مبنى 1',
                      value: ' س',
                      iconPath: 'assets/images/user_cicrle.png',
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
