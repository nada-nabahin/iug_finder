import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/widget/app_app_bar.dart';

import 'widget/contact_info_card.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'تواصل معنا'),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 50.h),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const ContactInfoCard(
                label: 'رقم الهاتف',
                value: '0599999999',
                iconPath: 'assets/images/phone.png',
              ),
              verticalSpace(35),
              const ContactInfoCard(
                label: ' البريد الالكتروني',
                value: 'amnat@gmail.com',
                iconPath: 'assets/images/email.png',
              ),
              verticalSpace(35),
              const ContactInfoCard(
                label: 'المكتب',
                value: 'مبنى الحيدان الطابق الثاني غرفة202',
                iconPath: 'assets/images/location.png',
              ),
            ],
          ),
        ),
      )),
    );
  }
}
