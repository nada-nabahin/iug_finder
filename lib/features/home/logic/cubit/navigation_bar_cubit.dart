import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(const NavigationBarInitial(0));

  void setSelectedIndex(int index) {
    emit(NavigationBarInitial(index));
  }
}
