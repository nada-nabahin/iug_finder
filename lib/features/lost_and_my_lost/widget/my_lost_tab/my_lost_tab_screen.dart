import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/all_lost_tab/searchTextField.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/my_lost_tab/my_reports_bloc_builder.dart';

class MyLostTabScreen extends StatelessWidget {
  const MyLostTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LostAndMyLostCubit>();
    return Column(
      children: [
        SearchTextField(
          filterCallback: (query) => cubit.filterMyReports(query),
        ),
        const MyReportsBlocBuilder(),
      ],
    );
  }
}
