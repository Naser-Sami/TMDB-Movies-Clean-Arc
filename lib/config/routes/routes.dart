import 'package:clean_architecture_structure/core/core.dart';
import 'package:clean_architecture_structure/features/main_page.dart';
import 'package:clean_architecture_structure/features/movies/movie.dart';

import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String noInternetConnectionRoute = "/no_internet_connection";
  static const String onboardingRoute = "/onboarding";
  static const String authRoute = "/auth";
  static const String registerRoute = "/register";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgot_password";
  static const String homePageRoute = "/home_page";
  static const String settingsPageRoute = "/settings_page";
  static const String profilePageRoute = "/profile_page";

  static const String moviesPage = "/movies_page";
  static const String moviesDetailsPage = "/movies_details_page";
}

class RoutesGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePageRoute:
        return MaterialPageRoute(builder: (context) => const MainPage());

      case Routes.moviesPage:
        return MaterialPageRoute(builder: (context) => const MoviesPage());

      // case Routes.moviesDetailsPage:
        // return MaterialPageRoute(builder: (context) => const MovieDetailScreen(id: null,));

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(child: Text(AppStrings.noRouteFound)),
          )),
    );
  }

  static Route<dynamic> noInternetConnectionRoute() {
    return MaterialPageRoute(
      builder: ((context) => Scaffold(
            body: Center(
                child: Text(
              DataSource.NO_INTERNET_CONNECTION.getFailure().message,
            )),
          )),
    );
  }
}
