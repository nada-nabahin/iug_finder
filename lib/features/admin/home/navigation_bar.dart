import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/di/dependency_injection.dart';
import 'package:iug_finder/core/helpers/extension.dart';
import 'package:iug_finder/core/routing/routers.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/features/admin/home/logic/cubit/navigation_bar_cubit.dart';
import 'package:iug_finder/features/admin/home/logic/cubit/navigation_bar_state.dart';
import 'package:iug_finder/features/admin/home/widget/navgation_bar.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/logic/cubit/lost_and_my_founa_cubit.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/lost_and_my_lost.dart';
import 'package:iug_finder/features/admin/match_screen/logic/cubit/matching_cubit.dart';
import 'package:iug_finder/features/admin/match_screen/ui/widget/matching_screen.dart';
import 'package:iug_finder/features/contact_us_screen/contact_us.dart';
import 'package:iug_finder/features/edit_profile_screen/edit_profile_screen.dart';
import 'package:iug_finder/features/edit_profile_screen/logic/cubit/get_user_data_cubit.dart';
import 'package:iug_finder/features/notifcation_screen/notification_screen.dart';

class BottomNavigationBarrAdmin extends StatelessWidget {
  const BottomNavigationBarrAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarAdminCubit, NavigationBarAdminState>(
      builder: (context, state) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            viewInsets: EdgeInsets.zero, // Ignore keyboard height
          ),
          child: Scaffold(
            floatingActionButton: Transform.translate(
              offset: const Offset(0, 0), // Adjust vertical position
              child: FloatingActionButton(
                onPressed: () {
                  context.pushNamed(Routers.createReportScreen);
                },
                backgroundColor: ColorsManager.moreLightBlue,
                elevation: 2,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add,
                  color: ColorsManager.white,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: _getPage(state.selectedIndex),
            bottomNavigationBar: navigationBar(context),
          ),
        );
      },
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return BlocProvider(
          create: (context) => AllLostAndFoundCubit(getIt())..getAllLost(),
          child: const LostAndMyFoundAdmin(),
        );
      case 1:
        return BlocProvider(
          create: (context) => MatchingCubit(getIt())..getAllMatching(),
          child: const MatchingScreen(),
        );

      default:
        return const Center(
          child: Text('Page not found'),
        );
    }
  }
}
