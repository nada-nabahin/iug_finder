import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/features/home/widget/category_report_list_view_item.dart';

class CategoryListView extends StatelessWidget {
  // final List<SpecializationsData?> specializationDataList;
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        //physics: const BouncingScrollPhysics(),
        //shrinkWrap: true,
        itemBuilder: (context, index) {
          return CategoryListViewItem(
              // specializationsData: specializationDataList[index],
              itemIndex: index);
        },
      ),
    );
  }
}
