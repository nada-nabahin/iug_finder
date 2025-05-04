import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/helpers/extension.dart';
import 'package:iug_finder/core/theming/styles.dart';
import 'package:iug_finder/features/home/widget/lost_found_post_card.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_state.dart';

class MyLostReportsListView extends StatelessWidget {
  final List<Report?>? reportsList;

  const MyLostReportsListView({super.key, this.reportsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: reportsList?.length,
        itemBuilder: (context, index) {
          final report = reportsList?[index];

          return LostFoundPostCard(
            reportsModel: report,
            isMyReport: true,
          );
        },
      ),
    );
  }
}
