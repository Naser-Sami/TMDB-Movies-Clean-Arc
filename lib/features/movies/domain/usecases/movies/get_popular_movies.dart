
// *********************************************************
///    important note
///    presentation layer just talk with domain/usecases
// *********************************************************

import 'package:dartz/dartz.dart';

import '/core/core.dart';
import '../../domain.dart';

class GetPopularMoviesUsecase extends BaseUsecase<List<Movies>, NoP> {
  final BaseMovieRepository repository;
  GetPopularMoviesUsecase(this.repository);

  // parameters if exist will be send from the presentation layer
  @override
  Future<Either<Failure, List<Movies>>> call(NoP p) async {
    return await repository.getPopularMovies();
  }
}