import 'package:dio/dio.dart';

import '../../../../../config/config.dart';
import '/core/core.dart';
import '../../../movie.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsP p);

  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationP p);
}

class MoviesRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final Response response =
        await Dio().get(ApiConstance.popularMoviesFinalPath);

    if (response.statusCode == 200) {
      // LoggerDebug.loggerDebugMessage(response);
      // LoggerDebug.loggerDebugMessage('movies response: $response');
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      // throw Exception('Couldn\'t load popular movies. ');
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final Response response =
        await Dio().get(ApiConstance.nowPlayingMoviesFinalPath);

    if (response.statusCode == 200) {

      showSnackBar("Request Successful", showCloseIcon: true);

      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      showSnackBar("Failed to load data");
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final Response response =
        await Dio().get(ApiConstance.topRatedMoviesFinalPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsP p) async {
    final Response response =
        await Dio().get(ApiConstance.moviesDetailsFinalPath(p.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(
      RecommendationP p) async {
    final Response response =
        await Dio().get(ApiConstance.recommendationMoviesFinalPath(p.id));

    // LoggerDebug.loggerDebugMessage(response.statusCode);
    // LoggerDebug.loggerDebugMessage(response.data);

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
