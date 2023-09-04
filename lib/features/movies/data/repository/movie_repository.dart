import 'package:dartz/dartz.dart';

import '/core/core.dart';
import '../../movie.dart';

class MovieRepository implements BaseMovieRepository {
  final BaseMovieRemoteDataSource baseRemoteDataSource;

  MovieRepository(this.baseRemoteDataSource);

  // ****************
  //  Movies
  // ****************

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final result = await baseRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.message,
        ),
      );
    }
  }


  // ****************
  //  Movies Details
  // ****************

  @override
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(MovieDetailsP p) async {
    final result = await baseRemoteDataSource.getMoviesDetails(p);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(p) async {
    final result = await baseRemoteDataSource.getRecommendationMovies(p);
    // LoggerDebug.loggerErrorMessage('result $result');
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.message,
        ),
      );
    }
  }
}
