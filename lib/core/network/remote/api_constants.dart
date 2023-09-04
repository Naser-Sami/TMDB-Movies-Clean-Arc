class ApiConstance {
  // "API_KEY": "",
  // "BASE_API_URL": "https://api.themoviedb.org/3",
  // "BASE_IMAGE_API_URL": "https://image.tmdb.org/t/p/original/"

  static const String apiKey = '';
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
}