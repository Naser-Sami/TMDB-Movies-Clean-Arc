import 'package:equatable/equatable.dart';

import 'entities.dart';

// https://developer.themoviedb.org/reference/movie-details

class MoviesDetails extends Equatable {
  //
  final int? id;
  final String? backdropPath;
  final String? title;
  final String? releaseDate;
  final num? voteAverage;
  final String? overview;
  // final List<Map<String, dynamic>>? genres;
  final List<Genres>? genres;
  final int runtime;

  const MoviesDetails({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.overview,
    required this.genres,
    required this.runtime,
  });

  @override
  List<Object?> get props => [
    id, backdropPath, title, releaseDate, voteAverage, overview, genres, runtime
  ];
}
