import 'package:clean_architecture_structure/features/movies/presentation/bloc/movies_details/movies_details_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../config/config.dart';
import '../../features/movies/movie.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {

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
