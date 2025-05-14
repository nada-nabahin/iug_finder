import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/features/admin/home/logic/cubit/navigation_bar_state.dart';

class NavigationBarAdminCubit extends Cubit<NavigationBarAdminState> {
  NavigationBarAdminCubit()
      : super(const NavigationBarAdminState(selectedIndex: 0));

  // void setSelectedIndex(int index) {
  //   emit(NavigationBarInitial(index));
  // }

  void updateIndex(int newIndex) {
    if (newIndex != state.selectedIndex) {
      emit(NavigationBarAdminState(selectedIndex: newIndex));
    }
  }
}
