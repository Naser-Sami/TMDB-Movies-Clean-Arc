import 'package:clean_architecture_structure/core/core.dart';
import 'package:clean_architecture_structure/features/movies/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecommendationMoviesUsecase extends BaseUsecase<List<Recommendation>, RecommendationP> {

  final BaseMovieRepository baseMovieRepository;
  GetRecommendationMoviesUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationP p) async {
    return await baseMovieRepository.getRecommendationMovies(p);
  }
}

class RecommendationP extends Equatable {
  final int id;
  const RecommendationP({required this.id});

  @override
  List<Object?> get props => [id ];
}