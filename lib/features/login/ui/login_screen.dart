import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/core/widget/app_text_button.dart';
import 'package:iug_finder/features/login/logic/cubit/login_cubit.dart';
import 'package:iug_finder/features/login/ui/widget/already_have_account_text.dart';
import 'package:iug_finder/features/login/ui/widget/email_and_password.dart';
import 'package:iug_finder/features/login/ui/widget/login_bloc_listener.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorsManager.mainBlue,
                    ColorsManager.lightBlue,
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace(22.h),
                    Image.asset(
                      'assets/images/logo.png',
                    ),
                    verticalSpace(22.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      //  height: 550.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorsManager.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr('login'),
                              style: TextStyles.font24DarkBold,
                            ),
                            verticalSpace(20.h),
                            const EmailAndPassword(),
                            verticalSpace(16.h),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                tr('forget_password'),
                                style: TextStyles.font13BlueRegular,
                              ),
                            ),
                            verticalSpace(35.h),
                            AppTextButton(
                              buttonText: tr('login'),
                              textStyle: TextStyles.font16WhiteSemiBold,
                              onPressed: () {
                                validateThenLogin(context);
                              },
                            ),
                            verticalSpace(16),
                            const AlreadyHaveAccountText(),
                            const LoginBlocListener(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
