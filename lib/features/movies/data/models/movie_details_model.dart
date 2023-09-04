import '../../domain/domain.dart';
import '../data.dart';

class MovieDetailsModel extends MoviesDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.backdropPath,
      required super.title,
      required super.releaseDate,
      required super.voteAverage,
      required super.overview,
      required super.genres,
      required super.runtime});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      title: json['title'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      overview: json['overview'],
      genres: List<GenresModel>.from(
        json['genres'].map((e) => GenresModel.fromJson(e)),
      ),
      runtime: json['runtime'],
    );
  }
}
