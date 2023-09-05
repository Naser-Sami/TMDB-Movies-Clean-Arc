import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/config.dart';
import 'core/core.dart';
import 'features/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set the fit size (Find your UI design,
    // look at the dimensions of the device screen and fill it in,unit in dp)

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ThemeBloc>()
            ..add(CurrentThemeEvent(theme: AppTheme.values[0]))
            // ..add(const ThemeChangedEvent(theme: AppTheme.light)),
        ),
        BlocProvider(create: (context) => sl<NavigationBarCubit>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LoadedThemeState) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: MaterialApp(
                    title: AppStrings.appName,
                    scaffoldMessengerKey: scaffoldKey,
                    debugShowCheckedModeBanner: false,
                    themeMode: state.themeMode,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    home: const MainPage(),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
