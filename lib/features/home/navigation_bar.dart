import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/di/dependency_injection.dart';
import 'package:iug_finder/core/helpers/extension.dart';
import 'package:iug_finder/core/routing/routers.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/features/contact_us_screen/contact_us.dart';
import 'package:iug_finder/features/edit_profile_screen/edit_profile_screen.dart';
import 'package:iug_finder/features/edit_profile_screen/logic/cubit/get_user_data_cubit.dart';
import 'package:iug_finder/features/home/logic/cubit/navigation_bar_cubit.dart';
import 'package:iug_finder/features/home/logic/cubit/navigation_bar_state.dart';
import 'package:iug_finder/features/home/widget/navgation_bar.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';
import 'package:iug_finder/features/lost_and_my_lost/lost_and_my_lost.dart';
import 'package:iug_finder/features/notifcation_screen/notification_screen.dart';
import 'package:iug_finder/features/profile_screen/profile_screen.dart';

class BottomNavigationBarr extends StatelessWidget {
  const BottomNavigationBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarCubit, NavigationBarState>(
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
          create: (context) => LostAndMyLostCubit(getIt())..getAllLost(),
          child: const LostAndMyLost(),
        );
      case 1:
        return const NotificationScreen();
      case 2:
        return const ContactUsScreen();
      case 3:
        return BlocProvider(
          create: (context) => GetUserDataCubit(getIt())..getUserData(),
          child: const EditProfileScreen(),
        );
      default:
        return const Center(
          child: Text('Page not found'),
        );
    }
  }
}
