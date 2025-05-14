import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/features/home/logic/cubit/navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(const NavigationBarState(selectedIndex: 0));

  // void setSelectedIndex(int index) {
  //   emit(NavigationBarInitial(index));
  // }

  void updateIndex(int newIndex) {
    if (newIndex != state.selectedIndex) {
      emit(NavigationBarState(selectedIndex: newIndex));
    }
  }
}
