import 'package:flutter/material.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/features/create_report.dart/logic/cubit/create_report_cubit.dart';
import 'package:iug_finder/features/create_report.dart/ui/widget/dropdown_field.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';

Widget buildDropdownFields(CreateReportCubit cubit) {
  return Column(
    children: [
      DropdownField(
        title: 'نوع البلاغ',
        hint: 'اختر نوع البلاغ',
        controller: cubit.statusController,
        items: const ['مفقود', 'موجود'],
      ),
      verticalSpace(16),
      DropdownField(
        title: 'نوع التصنيف',
        hint: 'اختر تصنيف المفقود او الموجود',
        controller: cubit.itemTypeController,
        items: const [
          'محفظة',
          'شاحن أو وصلة',
          'كتاب',
          'مفتاح',
          'جوال',
          'حقيبة',
          'ملابس',
          'أخري'
        ],
      ),
      verticalSpace(16),
      DropdownField(
        title: 'لونه',
        hint: 'اختر لون المشقود',
        controller: cubit.colorController,
        items: const ['أسود', 'أبيض', 'أحمر', 'أخضر', 'أصفر', 'أزرق'],
      ),
    ],
  );
}
