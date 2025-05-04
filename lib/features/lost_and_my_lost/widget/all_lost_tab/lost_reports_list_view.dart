import 'package:flutter/cupertino.dart';
import 'package:iug_finder/features/home/widget/lost_found_post_card.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';

class LostReportsListView extends StatelessWidget {
  final List<Report?>? reportsList;

  const LostReportsListView({super.key, this.reportsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: reportsList?.length,
        itemBuilder: (context, index) {
          final report = reportsList![index];

          return LostFoundPostCard(
            reportsModel: report,
            isMyReport: false,
          );
        },
      ),
    );
  }
}
