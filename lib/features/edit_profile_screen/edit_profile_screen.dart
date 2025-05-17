import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/helpers/app_regex.dart';
import 'package:iug_finder/core/helpers/extension.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/routing/routers.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/core/widget/app_app_bar.dart';
import 'package:iug_finder/core/widget/app_text_button.dart';
import 'package:iug_finder/core/widget/app_text_form_field.dart';
import 'package:iug_finder/features/edit_profile_screen/data/model/edit_profile_response_model.dart';
import 'package:iug_finder/features/edit_profile_screen/logic/cubit/get_user_data_cubit.dart';
import 'package:iug_finder/features/edit_profile_screen/logic/cubit/get_user_data_state.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppAppBar(
          title: 'تعديل البيانات الشخصية',
          actions: [
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.red),
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('تأكيد تسجيل الخروج'),
                        content:
                            const Text('هل أنت متأكد أنك تريد تسجيل الخروج؟'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('إلغاء'),
                          ),
                          TextButton(
                            onPressed: () async {
                              await context
                                  .read<GetUserDataCubit>()
                                  .deleteTokenFromSharedPreferences();
                              Navigator.of(context).pop();

                              context
                                  .pushNamedAndRemoveUntil(Routers.loginScreen);
                            },
                            child: const Text('تسجيل الخروج'),
                          ),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
        body: BlocConsumer<GetUserDataCubit, GetUserDataState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (data) {
                if (data is EditProfileResponseModel) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('تم تحديث الملف الشخصي بنجاح'),
                      backgroundColor: ColorsManager.green800,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            );
          },
          builder: (context, state) {
            final cubit = context.read<GetUserDataCubit>();

            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (profileResponse) =>
                  _buildProfileContent(context, cubit, profileResponse),
              imagePicked: (image) =>
                  _buildProfileContent(context, cubit, null),
              error: (error) => Center(child: Text(error)),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    GetUserDataCubit cubit,
    dynamic profileResponse,
  ) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorsManager.lightBlue, ColorsManager.mainBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
        child: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                _buildProfileImage(cubit, profileResponse),
                verticalSpace(40.h),
                _buildFormFields(cubit),
                verticalSpace(30.h),
                _buildSaveButton(cubit, context),
                verticalSpace(40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(GetUserDataCubit cubit, dynamic profileResponse) {
    return GestureDetector(
      onTap: () => cubit.pickAndSetImage(),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70.r,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: _buildProfileImageContent(cubit, profileResponse),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: const BoxDecoration(
                color: ColorsManager.mainBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 24.r,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImageContent(
      GetUserDataCubit cubit, dynamic profileResponse) {
    if (cubit.selectedImage != null) {
      return Image.file(
        cubit.selectedImage!,
        width: 130.r,
        height: 130.r,
        fit: BoxFit.cover,
      );
    }

    if (profileResponse?.user.photo != null &&
        profileResponse.user.photo.isNotEmpty) {
      return Image.network(
        'http://11.11.11.74:3000/uploads/${profileResponse.user.photo}',
        width: 130.r,
        height: 130.r,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildDefaultAvatar(),
      );
    } else if (profileResponse?.user.photo == null) {
      return Image.file(
        File(cubit.imagePath!),
        width: 130.r,
        height: 130.r,
        fit: BoxFit.cover,
      );
    } else if (profileResponse?.user.photo == null) {
      return Image.network(
        'http://11.11.11.74:3000/uploads/1747485964673-448835708.jpg',
        width: 130.r,
        height: 130.r,
        fit: BoxFit.cover,
      );
      ;
    }

    return _buildDefaultAvatar();
  }

  Widget _buildDefaultAvatar() {
    return Image.network(
      'http://11.11.11.74:3000/uploads/1747485964673-448835708.jpg',
      width: 130.r,
      height: 130.r,
      fit: BoxFit.cover,
    );
  }

  Widget _buildFormFields(GetUserDataCubit cubit) {
    return Column(
      children: [
        AppTextFormField(
          controller: cubit.nameController,
          hintText: "الاسم الكامل",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "يرجى إدخال الاسم الكامل";
            }
            return null;
          },
        ),
        verticalSpace(20.h),
        AppTextFormField(
          controller: cubit.numberController,
          hintText: "الرقم الجامعي",
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty || !AppRegex.idNumber(value)) {
              return "رقم جامعي غير صحيح";
            }
            return null;
          },
        ),
        verticalSpace(20.h),
        AppTextFormField(
          controller: cubit.phoneController,
          hintText: "رقم الهاتف",
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "يرجى إدخال رقم الهاتف";
            }
            return null;
          },
        ),
        verticalSpace(20.h),
        AppTextFormField(
          controller: cubit.emailController,
          hintText: "البريد الإلكتروني",
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isEmailValid(value)) {
              return "بريد إلكتروني غير صحيح";
            }
            return null;
          },
        ),
        verticalSpace(20.h),
        AppTextFormField(
          controller: cubit.passwordController,
          hintText: "كلمة المرور",
          isObscureText: cubit.isObscureText,
          suffixIcon: IconButton(
            icon: Icon(
              cubit.isObscureText ? Icons.visibility_off : Icons.visibility,
              color: ColorsManager.mainBlue,
            ),
            onPressed: () => cubit.isObscureText = !cubit.isObscureText,
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(GetUserDataCubit cubit, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: AppTextButton(
        buttonText: "حفظ التغييرات",
        onPressed: () async {
          print("cubit.selectedImage ${cubit.selectedImage}");
          print("cubit.imagePath ${cubit.imagePath}");
          if (cubit.selectedImage == null && cubit.imagePath == null) {
            // Show error if no image is selected
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("يرجى اختيار صورة قبل حفظ التغييرات"),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
          if (cubit.formKey.currentState!.validate()) {
            await cubit.updateUserData();
          }
        },
        backgroundColor: ColorsManager.mainBlue,
        textStyle: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
