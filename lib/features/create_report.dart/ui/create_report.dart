import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iug_finder/core/helpers/extension.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/core/widget/app_app_bar.dart';
import 'package:iug_finder/core/widget/app_text_button.dart';
import 'package:iug_finder/core/widget/app_text_form.dart';
import 'package:iug_finder/core/widget/app_text_form_field.dart';
import 'package:iug_finder/features/create_report.dart/logic/cubit/create_report_cubit.dart';
import 'package:iug_finder/features/create_report.dart/logic/cubit/create_report_state.dart';
import 'package:iug_finder/features/create_report.dart/ui/widget/build_drop_down_fields.dart';
import 'package:iug_finder/features/create_report.dart/ui/widget/create_report_bloc_listener.dart';
import 'package:iug_finder/features/create_report.dart/ui/widget/date_time_field.dart';
import 'package:iug_finder/features/create_report.dart/ui/widget/dropdown_field.dart';

class CreateReportScreen extends StatelessWidget {
  const CreateReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CreateReportCubit>();
    return SafeArea(
      child: Scaffold(
        appBar: AppAppBar(title: "إضافة بلاغ جديد"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildDropdownFields(cubit),
                  verticalSpace(16),
                  DateTimeField(
                    dateController: cubit.dateController,
                    timeController: cubit.timeController,
                  ),
                  verticalSpace(16),
                  AppTextFormField2(
                      hintText: "حدد المبني والمكان",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'مطلوب';
                        }
                        return null;
                      },
                      controller: cubit.locationController),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      await cubit.pickAndSetImage();
                    },
                    child: BlocConsumer<CreateReportCubit, CreateReportState>(
                      listener: (context, state) {
                        if (state is ImagePicked) {}
                      },
                      builder: (context, state) {
                        final cubit = context.read<CreateReportCubit>();
                        return Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: ColorsManager.cyan.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: cubit.selectedImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    cubit.selectedImage!,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'اضغط هنا لاختيار صورة',
                                    style: TextStyles.font14BlackMedium,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppTextFormField2(
                    controller: cubit.descriptionController,
                    hintText: "وصف البلاغ",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'مطلوب';
                      }
                      return null;
                    },
                    maxLines: 5,
                  ),
                  const SizedBox(height: 24),
                  AppTextButton(
                    buttonText: 'إرسال البلاغ',
                    onPressed: () => validateThenCreateREport(context),
                    textStyle: TextStyles.font16WhiteSemiBold,
                  ),
                  const CreateREportBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenCreateREport(BuildContext context) {
    if (context.read<CreateReportCubit>().formKey.currentState != null &&
        context.read<CreateReportCubit>().formKey.currentState!.validate()) {
      context.read<CreateReportCubit>().emitCreateReportStates();
    }
  }
}
