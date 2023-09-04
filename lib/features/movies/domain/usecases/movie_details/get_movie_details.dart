 import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../domain.dart';
import '/core/core.dart';

class GetMovieDetailsUsecase extends BaseUsecase<MoviesDetails, MovieDetailsP> {

  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MoviesDetails>> call(MovieDetailsP p) async {
    return await baseMovieRepository.getMoviesDetails(p);
  }
}

// create parameter class if we need to send a parameters
// class MoviesDetailsParameters extends Equatable {
class MovieDetailsP extends Equatable {
  final int movieId;
  const MovieDetailsP({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}