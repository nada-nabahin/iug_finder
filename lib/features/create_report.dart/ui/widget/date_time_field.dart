import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/styles.dart';

class DateTimeField extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController timeController;

  const DateTimeField({
    super.key,
    required this.dateController,
    required this.timeController,
  });

  InputDecoration _getInputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: ColorsManager.cyan.withOpacity(0.2),
      hintStyle: TextStyles.font14BlackMedium,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      suffixIcon: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: dateController,
            decoration:
                _getInputDecoration('حدد التاريخ', Icons.calendar_today),
            readOnly: true,
            onTap: () => _selectDate(context),
            validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: timeController,
            decoration: _getInputDecoration('اختر الوقت', Icons.access_time),
            readOnly: true,
            onTap: () => _selectTime(context),
            validator: (value) => value?.isEmpty ?? true ? 'مطلوب' : null,
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      timeController.text = picked.format(context);
    }
  }
}
