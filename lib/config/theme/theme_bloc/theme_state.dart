part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

class LoadedThemeState extends ThemeState {
  final ThemeMode themeMode;
  const LoadedThemeState({ required this.themeMode });

  @override
  List<Object> get props => [themeMode];
}