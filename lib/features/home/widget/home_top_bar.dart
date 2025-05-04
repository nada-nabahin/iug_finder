import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/helpers/extension.dart';
import 'package:iug_finder/core/helpers/spacing.dart';
import 'package:iug_finder/core/routing/routers.dart';
import 'package:iug_finder/features/login/data/models/login_res_body.dart';
import 'package:iug_finder/features/login/logic/cubit/login_cubit.dart';
import 'package:iug_finder/features/login/logic/cubit/login_state.dart';

import '../../../../core/theming/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Text(
                  'مرحبا, ندى!',
                  style: TextStyles.font18DarkBlueBold,
                );
              },
            ),
            verticalSpace(4),
            Text(
              'كيف حالك اليوم؟',
              style: TextStyles.font12GrayRegular,
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
            onTap: () => context.pushNamed(Routers.notificationScreen),
            child: Image.asset('assets/images/notification.png')),
      ],
    );
  }
}
