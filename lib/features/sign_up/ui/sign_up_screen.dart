import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/core/widget/app_text_button.dart';
import 'package:iug_finder/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:iug_finder/features/sign_up/ui/widget/already_have_account_text.dart';
import 'package:iug_finder/features/sign_up/ui/widget/sign_up_bloc_listener.dart';
import 'package:iug_finder/features/sign_up/ui/widget/sign_up_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(40.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    // height: 550.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorsManager.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          tr('create_new_account'),
                          style: TextStyles.font24DarkBold,
                        ),
                        verticalSpace(20.h),
                        const SignupForm(),
                        verticalSpace(20),
                        AppTextButton(
                          buttonText: tr('create_account'),
                          textStyle: TextStyles.font16WhiteSemiBold,
                          onPressed: () {
                            validateThenDoSignup(context);
                          },
                        ),
                        verticalSpace(20.h),
                        const AlreadyHaveAccountText(),
                        const SignupBlocListener(),
                      ],
                    ),
                  ),
                  verticalSpace(20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
