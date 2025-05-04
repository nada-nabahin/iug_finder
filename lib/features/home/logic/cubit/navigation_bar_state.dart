part of 'navigation_bar_cubit.dart';

@immutable
abstract class NavigationBarState {
  final int selectedIndex;
  const NavigationBarState(this.selectedIndex);
}

class NavigationBarInitial extends NavigationBarState {
  const NavigationBarInitial(super.selectedIndex);
}
