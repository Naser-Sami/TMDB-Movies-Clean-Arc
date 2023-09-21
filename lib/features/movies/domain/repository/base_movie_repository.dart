import 'package:dartz/dartz.dart';

import '/core/core.dart';
import '../domain.dart';

abstract class BaseMovieRepository {

  // create just abstract methods
  // do not implement methods here *

  // Get a list of movies ordered by popularity.
  // https://api.themoviedb.org/3/movie/popular?api_key=4f0209f6eb4a21dcd94c85bccfe26280


  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();

  
  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  // ****************
  //  Movies Details
  // ****************
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(MovieDetailsP p);

  // ************************
  //  Recommendation Movies
  // ************************
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(RecommendationP p);

}