import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/features/create_report.dart/logic/cubit/create_report_cubit.dart';

class DropdownField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final List<String> items;

  const DropdownField({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.items,
  });

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyles.font14BlackMedium,
      filled: true,
      fillColor: ColorsManager.cyan.withOpacity(0.2),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.font14BlackMedium),
        const SizedBox(height: 8),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, _) {
            return DropdownButtonFormField<String>(
              decoration: _getInputDecoration(),
              value: items.contains(controller.text) ? controller.text : null,
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyles.font14BlackMedium),
                );
              }).toList(),
              validator: (value) => value == null ? 'مطلوب' : null,
              onChanged: (value) => controller.text = value ?? '',
            );
          },
        ),
      ],
    );
  }
}
