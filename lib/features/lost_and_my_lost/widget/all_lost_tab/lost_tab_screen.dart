import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/widget/app_text_form.dart';
import 'package:iug_finder/features/home/widget/lost_found_post_card.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_state.dart';
import 'package:iug_finder/features/lost_and_my_lost/lost_and_my_lost.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/all_lost_tab/lost_bloc_builder.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/all_lost_tab/searchTextField.dart';

class LostTabScreen extends StatelessWidget {
  const LostTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LostAndMyLostCubit>();

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
