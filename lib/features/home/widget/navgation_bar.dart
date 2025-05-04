import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/features/home/logic/cubit/navigation_bar_cubit.dart';

Widget navigationBar(BuildContext context) {
  return BlocBuilder<NavigationBarCubit, NavigationBarState>(
    builder: (context, state) {
      return NavigationBar(
        selectedIndex: state.selectedIndex,
        onDestinationSelected: (index) {
          context.read<NavigationBarCubit>().setSelectedIndex(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: ColorsManager.moreLightBlue,
            ),
            label: 'Home',
            selectedIcon: Icon(Icons.home, color: ColorsManager.moreLightBlue),
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined,
                color: ColorsManager.moreLightBlue),
            label: 'Notifications',
            selectedIcon:
                Icon(Icons.notifications, color: ColorsManager.moreLightBlue),
          ),
          NavigationDestination(
            icon: Icon(Icons.call_outlined, color: ColorsManager.moreLightBlue),
            label: 'Contact',
            selectedIcon: Icon(Icons.call, color: ColorsManager.moreLightBlue),
          ),
          NavigationDestination(
            icon:
                Icon(Icons.person_outline, color: ColorsManager.moreLightBlue),
            label: 'Profile',
            selectedIcon:
                Icon(Icons.person, color: ColorsManager.moreLightBlue),
          ),
        ],
      );
    },
  );
}
