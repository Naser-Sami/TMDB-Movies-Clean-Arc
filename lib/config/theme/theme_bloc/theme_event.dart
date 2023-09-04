part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class CurrentThemeEvent extends ThemeEvent {
  final AppTheme theme;

  const CurrentThemeEvent({required this.theme});
  @override
  List<Object?> get props => [theme];
}

class ThemeChangedEvent extends ThemeEvent {
  final AppTheme theme;

  const ThemeChangedEvent({required this.theme});

  @override
  List<Object?> get props => [theme];
}
