import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/logic/cubit/lost_and_my_founa_cubit._state.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/logic/cubit/lost_and_my_founa_cubit.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/widget/my_lost_tab/my_lost_reports_list_view.dart';

class MyReportsBlocBuilder extends StatelessWidget {
  const MyReportsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllLostAndFoundCubit, AllLostAndFoundState>(
      // Listen for delete report success or error
      listener: (context, state) {
        state.whenOrNull(
          deleteReportSuccess: (deleteReportResponse) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(deleteReportResponse.message),
                behavior: SnackBarBehavior.floating,
                backgroundColor: ColorsManager.green800,
              ),
            );
          },
          deleteReportError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                // content: Text('فشل الحذف: $error'),
                content: Text(error.toString()),
                behavior: SnackBarBehavior.floating,
                backgroundColor: ColorsManager.red800,
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
    return SizedBox.shrink(
      child: Text(
        tr('something_wrong'),
        style: TextStyles.font14BlackMedium,
      ),
    );
  }
}
