import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '/core/core.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final List<bool> selectedAppTheme = <bool>[ true, false, false ];

  final List<Widget> app_theme = <Widget>[
    const Text('System'),
    const Text('Light'),
    const Text('Dark'),
  ];

  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>(_onThemeEvent);
  }

  _onThemeEvent(ThemeEvent event, Emitter<ThemeState> emit) async {
    if (event is CurrentThemeEvent) {
      final themeIndex = await ThemeCacheHelper().getCachedThemeIndex();
      for (int i = 0; i < selectedAppTheme.length; i++) {
        if (i == themeIndex) {
          selectedAppTheme[themeIndex] = true;
        } else {
          selectedAppTheme[i] = false;
        }
      }
      emit(LoadedThemeState(themeMode: ThemeMode.values[themeIndex]));
    }

    else if (event is ThemeChangedEvent) {
      final themeIndex = event.theme.index;
      await ThemeCacheHelper().cacheThemeIndex(themeIndex);

      // The button that is tapped is set to true, and the others to false.
      for (int i = 0; i < selectedAppTheme.length; i++) {
        if (i == themeIndex) {
          selectedAppTheme[themeIndex] = true;
        } else {
          selectedAppTheme[i] = false;
        }
      }
      emit(LoadedThemeState(themeMode: ThemeMode.values[themeIndex]));
    }
  }
}
