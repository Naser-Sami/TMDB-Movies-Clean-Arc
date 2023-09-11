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
  final bool isSystemMode;
  final bool isDarkMode;
  final bool isLightMode;

  const LoadedThemeState({ required this.themeMode,
    required this.isSystemMode,
   required this.isDarkMode,
   required this.isLightMode,  });

  @override
  List<Object> get props => [themeMode, isSystemMode, isDarkMode, isLightMode];
}