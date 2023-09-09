part of 'navigation_bar_cubit.dart';

abstract class NavigationBarState extends Equatable {
  const NavigationBarState();
}

class NavigationBarInitial extends NavigationBarState {
  @override
  List<Object> get props => [];
}

class NavigationBarIndexState extends NavigationBarState {
  final int index;
  const NavigationBarIndexState(this.index);

  @override
  List<Object> get props => [index];
}

class NavigationBarCurrentPageState extends NavigationBarState {
  final int index;
  const NavigationBarCurrentPageState(this.index);

  @override
  List<Object> get props => [index];
}
