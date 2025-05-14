import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final int reportId;
  final BuildContext parentContext;

  const DeleteConfirmationDialog({
    super.key,
    required this.reportId,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('حذف البلاغ'),
      content: const Text('هل أنت متأكد من رغبتك في حذف هذا البلاغ؟'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            parentContext.read<LostAndMyLostCubit>().deleteReport(reportId);
          },
          child: const Text('حذف', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
