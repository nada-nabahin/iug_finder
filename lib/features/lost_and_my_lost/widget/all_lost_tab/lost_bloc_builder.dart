import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_state.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/all_lost_tab/lost_reports_list_view.dart';

class LostBlocBuilder extends StatelessWidget {
  const LostBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LostAndMyLostCubit, LostAndMyLostState>(
      buildWhen: (previous, current) =>
          current is AllLostLoading ||
          current is AllLostSuccess ||
          current is AllLostError,
      builder: (context, state) {
        return state.maybeWhen(
            allLostLoading: () {
              return setupLoading(context);
            },
            allLostSuccess: (allLostDataList) {
              var allLostList = allLostDataList.reports;
              return setupSuccess(allLostList);
            },
            allLostError: (errorHandler) => setupError(),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }

  /// shimmer loading for specializations and doctors
  Widget setupLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget setupSuccess(allLostList) {
    return LostReportsListView(
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
