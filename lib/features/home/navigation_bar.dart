import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/di/dependency_injection.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/features/contact_us_screen/contact_us.dart';
import 'package:iug_finder/features/home/home_screen.dart';
import 'package:iug_finder/features/home/logic/cubit/navigation_bar_cubit.dart';
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
        return Scaffold(
          floatingActionButton: Transform.translate(
            offset: const Offset(0, 0), // Adjust vertical position
            child: FloatingActionButton(
              onPressed: () {
                // Add your action here
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
        return const ProfileScreen();
      default:
        return const ProfileScreen();
    }
  }
}
