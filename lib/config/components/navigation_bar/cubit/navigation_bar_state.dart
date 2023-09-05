part of 'navigation_bar_cubit.dart';

abstract class NavigationBarState extends Equatable {
  const NavigationBarState();
}

class NavigationBarInitial extends NavigationBarState {
  @override
  List<Object> get props => [];
}

class NavigationBarIndexState extends NavigationBarState {
  int index;
  NavigationBarIndexState(this.index);

  @override
  List<Object> get props => [index];
}

class NavigationBarCurrentPageState extends NavigationBarState {
  int index;
  NavigationBarCurrentPageState(this.index);

  @override
  List<Object> get props => [index];
}
