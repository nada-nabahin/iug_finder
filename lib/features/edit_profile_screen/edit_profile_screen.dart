import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/widget/app_text_button.dart';
import 'package:iug_finder/core/widget/app_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false, // Allow content to extend behind keyboard
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            constraints: const BoxConstraints
                .expand(), // Make the container expand to fill the available space

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [ColorsManager.mainBlue, ColorsManager.lightBlue],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
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
                      verticalSpace(40.h),
                      const AppTextFormField(
                        hintText: "اسم الطالب",
                        keyboardType: TextInputType.name,
                      ),
                      verticalSpace(20.h),
                      const AppTextFormField(
                        hintText: "رقم الطالب",
                        keyboardType: TextInputType.number,
                      ),
                      verticalSpace(20.h),
                      const AppTextFormField(
                        hintText: "رقم الهاتف",
                        keyboardType: TextInputType.phone,
                      ),
                      verticalSpace(20.h),
                      const AppTextFormField(
                        hintText: " البريد الالكتروني",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      verticalSpace(20.h),
                      AppTextFormField(
                        hintText: " كلمة المرور",
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      verticalSpace(50.h),
                      AppTextButton(
                        buttonText: ' حفط',
                        buttonWidth: 300,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
