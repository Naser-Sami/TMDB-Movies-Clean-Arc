import 'package:dartz/dartz.dart';

import '/core/core.dart';
import '../../domain.dart';

class GetNowPlayingMoviesUsecase extends BaseUsecase<List<Movies>, NoP> {
  final BaseMovieRepository baseMovieRepository;
  GetNowPlayingMoviesUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movies>>> call(NoP p) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}