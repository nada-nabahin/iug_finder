import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/features/admin/home/logic/cubit/navigation_bar_cubit.dart';
import 'package:iug_finder/features/admin/home/logic/cubit/navigation_bar_state.dart';
import 'package:iug_finder/features/home/logic/cubit/navigation_bar_cubit.dart';
import 'package:iug_finder/features/home/logic/cubit/navigation_bar_state.dart';

Widget navigationBar(BuildContext context) {
  return BlocBuilder<NavigationBarAdminCubit, NavigationBarAdminState>(
    builder: (context, state) {
      return NavigationBar(
        selectedIndex: state.selectedIndex,
        onDestinationSelected: (index) {
          context.read<NavigationBarCubit>().updateIndex(index);
        },
        height: 65.h,
        labelBehavior:
            NavigationDestinationLabelBehavior.alwaysHide, // Always show labels

        destinations: [
          NavigationDestination(
            icon: const Icon(
              Icons.home_outlined,
              color: ColorsManager.moreLightBlue,
            ),
            label: tr(
              'home_nav_bar',
            ),
            selectedIcon:
                const Icon(Icons.home, color: ColorsManager.moreLightBlue),
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline,
                color: ColorsManager.moreLightBlue),
            label: tr('profile'),
            selectedIcon:
                const Icon(Icons.person, color: ColorsManager.moreLightBlue),
          ),
        ],
        animationDuration: const Duration(milliseconds: 300),
      );
    },
  );
}
