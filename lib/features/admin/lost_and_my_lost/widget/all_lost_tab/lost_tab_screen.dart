import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/logic/cubit/lost_and_my_founa_cubit.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/widget/all_lost_tab/lost_bloc_builder.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/widget/all_lost_tab/searchTextField.dart';

class LostTabScreen extends StatelessWidget {
  const LostTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AllLostAndFoundCubit>();

    return Column(
      children: [
        SearchTextField(
          filterCallback: (query) => cubit.filterAllLost(query),
        ),
        const LostBlocBuilder(),
      ],
    );
  }
}
