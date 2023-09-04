import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int? id;
  final String? title;
  final String? language;
  final bool? isAdult;
  final List<int>? genreIds;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final num? votAverage;
  final String? releaseDate;

  const Movies(
      {required this.id,
      required this.title,
      required this.language,
      required this.isAdult,
      required this.genreIds,
      required this.overview,
      required this.posterPath,
      required this.backdropPath,
      required this.votAverage,
      required this.releaseDate});

  @override
  List<Object?> get props => [
        id,
        title,
        language,
        isAdult,
        genreIds,
        overview,
        posterPath,
        backdropPath,
        votAverage,
        releaseDate
      ];
}
