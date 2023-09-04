import '../../movie.dart';

class MovieModel extends Movies {
  const MovieModel({
    required super.id,
    required super.title,
    required super.language,
    required super.isAdult,
    required super.genreIds,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.votAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        language: json['original_language'],
        isAdult: json['adult'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        votAverage: json['vote_average'],
        releaseDate: json['release_date'],
      );
}
