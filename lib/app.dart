import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/config.dart';
import 'core/core.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isConnected = true;

  @override
  void initState() {
    checkInternetConnection();
    initialRoute();
    super.initState();
  }

  Future<bool> checkInternetConnection() async {
    // .. first check if internet is connected
    //.. app is connected with internet, it's safe to call the api's


    // LoggerDebug.loggerDebugMessage(await sl<NetworkInfo>().internetConnectionStatus);
    if(!kIsWeb) {
      if (await sl<NetworkInfo>().isConnected) {
        return isConnected = true;
      } else {
        return isConnected = false;
      }
    }

    return isConnected = true;
  }

  String? initialRoute() {
    if (isConnected) {
      // return Routes.homePageRoute;
      return Routes.entryPoint;
    }
    return Routes.noInternetConnectionRoute;
  }

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
            ),
        BlocProvider(create: (context) => sl<NavigationBarCubit>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LoadedThemeState) {
            return ScreenUtilInit(
              // todo check for desktop and web
              designSize: getFormFactor(context) == ScreenType.Desktop
                  ? const Size(1366, 768)
                  : getFormFactor(context) == ScreenType.Tablet
                      ? const Size(1024, 768)
                      : const Size(360, 690),
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
                    navigatorKey: sl<NavigationService>().navigatorKey,
                    scrollBehavior: scrollBehavior,
                    debugShowCheckedModeBanner: false,
                    themeMode: state.themeMode,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    initialRoute: initialRoute(),
                    onGenerateRoute: RoutesGenerator.getRoutes,
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
