import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/helpers/extension.dart';
import 'package:iug_finder/core/routing/routers.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/features/create_report.dart/logic/cubit/create_report_cubit.dart';
import 'package:iug_finder/features/create_report.dart/logic/cubit/create_report_state.dart';

class EditReportBlocListener extends StatelessWidget {
  const EditReportBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateReportCubit, CreateReportState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ));
          },
          success: (createReportResponse) {
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routers.navigationBar,
              // arguments: {
              //   'initialTabIndex': 1
              // }, // Pass the tab index as an argument
            );

            _showSnackBar(
              context,
              createReportResponse.message,
              ColorsManager.green800,
            );
          },
          error: (error) {
            context.pop();

            _showSnackBar(
              context,
              error,
              ColorsManager.red800,
            );
          },
          orElse: () {
            const SizedBox.shrink();
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
      ),
    );
  }
}
