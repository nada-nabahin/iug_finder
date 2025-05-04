import 'package:flutter/material.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/my_lost_tab/delete_confirmation_dialog.dart';

class DeleteReportButton extends StatelessWidget {
  final int reportId;

  const DeleteReportButton({super.key, required this.reportId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => DeleteConfirmationDialog(
          reportId: reportId,
          parentContext: context,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(
          Icons.delete_forever,
          color: ColorsManager.red800,
          size: 28,
        ),
      ),
    );
  }
}
