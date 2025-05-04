import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_state.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/all_lost_tab/lost_reports_list_view.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/all_lost_tab/lost_tab_screen.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/my_lost_tab/my_lost_reports_list_view.dart';

class MyReportsBlocBuilder extends StatelessWidget {
  const MyReportsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LostAndMyLostCubit, LostAndMyLostState>(
      listener: (context, state) {
        state.whenOrNull(
          deleteReportSuccess: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: ColorsManager.green800,
              ),
            );
          },
          deleteReportError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('فشل الحذف: $error'),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      buildWhen: (previous, current) =>
          current is AllMyReportsLoading ||
          current is AllMyReportsSuccess ||
          current is AllMyReportsError,
      builder: (context, state) {
        return state.maybeWhen(
            allMyReportsLoading: () {
              return setupLoading();
            },
            allMyReportsSuccess: (allMyREportsDataList) {
              var allMyReportsList = allMyREportsDataList.reports;

              return setupSuccess(allMyReportsList);
            },
            allMyReportsError: (errorHandler) => setupError(),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }

  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.mainBlue,
      ),
    );
  }

  Widget setupSuccess(allLostList) {
    return MyLostReportsListView(
      reportsList: allLostList,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink(
      child: Text("sorry, something went wrong"),
    );
  }
}
