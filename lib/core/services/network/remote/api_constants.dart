import 'package:dio/dio.dart';

class ApiConstance {
  // "API_KEY": "",
  // "BASE_API_URL": "https://api.themoviedb.org/3",
  // "BASE_IMAGE_API_URL": "https://image.tmdb.org/t/p/original/"

  static const String apiKey = '4f0209f6eb4a21dcd94c85bccfe26280';
  static const String apiKeyQuery = '?api_key=$apiKey';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  // end point
  static const String movieEndPoint  = '/movie';
  static const String popularEndPoint  = '$movieEndPoint/popular';
  static const String nowPlayingEndPoint  = '$movieEndPoint/now_playing';
  static const String topRatedEndPoint  = '$movieEndPoint/top_rated';

  // Movies Path
  static const String popularMoviesFinalPath = '$baseUrl$popularEndPoint$apiKeyQuery';
  static const String nowPlayingMoviesFinalPath = '$baseUrl$nowPlayingEndPoint$apiKeyQuery';
  static const String topRatedMoviesFinalPath = '$baseUrl$topRatedEndPoint$apiKeyQuery';
  static String moviesDetailsFinalPath(int movieId) => '$baseUrl$movieEndPoint/$movieId$apiKeyQuery';
  // https://api.themoviedb.org/3/movie/{movie_id}/recommendations
  static String recommendationMoviesFinalPath(int movieId) => '$baseUrl$movieEndPoint/$movieId/recommendations$apiKeyQuery';

  // Images from api
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  // get images
  static String imageUrl(String? path) => '$baseImageUrl$path';


  // ********************
  ///  Dio Base Options
  // ********************
  static const String accept = "accept";
  static const String authorization = "Authorization";
  static const String contentType = "Content-Type";
  static const int apiTimeOut = 6000;
  static const int connectTimeout = 6000;

  // static const String token = "SEND TOKEN HERE";
  static const String token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjAyMDlmNmViNGEyMWRjZDk0Yzg1YmNjZmUyNjI4MCIsInN1YiI6IjY0ZWNjZThiZTg5NGE2MDBlNGU3ZDIzOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lRDbyFOvsRCcga5m6s0vrPNww-ax88B3XAjMfXWCyKM";
  static const String applicationJson = "application/json";
  static String defaultLanguage = "en-US";


  static Map<String, String> headers = {
    accept: applicationJson,
    contentType: "application/json;charset=utf-8",
    authorization: token,
    defaultLanguage: defaultLanguage, // get language from app prefs
  };

  static BaseOptions getBaseOption() {
    return BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: const Duration(milliseconds: connectTimeout), // 60 seconds
      receiveTimeout: const Duration(milliseconds: apiTimeOut),
      sendTimeout: const Duration(milliseconds: apiTimeOut),
    );
  }

  static  Map<String, dynamic> query = {
    "api_key": apiKey,
    "language": "en-US",
  };
}