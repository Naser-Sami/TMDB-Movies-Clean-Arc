import 'package:clean_architecture_structure/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../config/config.dart';
import '../../features/movies/movie.dart';
import '../../features/movies/presentation/presentation.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {


    // ****************
    ///   Blocs , Factories
    // ****************
    sl.registerFactory(() => ThemeBloc());

    sl.registerFactory(
          () => MoviesBloc(
        sl(),
        sl(),
        sl(),
      ),
    );

    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl()));

    sl.registerFactory(() => NavigationBarCubit());



    // ****************
    ///   Internet Info
    // ****************
    if(!kIsWeb) {
      sl.registerLazySingleton<NetworkInfo>(
              () => NetworkInfoImpl(InternetConnectionChecker()));
    }


    // ****************
    ///   SharedPreferenceService
    // ****************

    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    sl.registerLazySingleton<SharedPreferenceService>(
            () => SharedPreferenceService(sl<SharedPreferences>()));


    // ****************
    ///   Dio
    // ****************
    sl.registerLazySingleton<HttpService>(() => HttpService());


    // ****************
    ///   Global Keys
    // ****************
    sl.registerLazySingleton(() => NavigationService());


    // ****************
    ///   Data Sources
    // ****************
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MoviesRemoteDataSource());


    // ****************
    ///   Repositories
    // ****************
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(
          sl<BaseMovieRemoteDataSource>(),
        ));


    // ****************
    ///   Usecases
    // ****************
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(
          sl<BaseMovieRepository>(),
        ));

    sl.registerLazySingleton(() => GetPopularMoviesUsecase(
          sl<BaseMovieRepository>(),
        ));

    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(
          sl<BaseMovieRepository>(),
        ));

    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetRecommendationMoviesUsecase(sl()));
  }
}
