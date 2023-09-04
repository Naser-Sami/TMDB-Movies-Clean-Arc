import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_structure/core/core.dart';
import 'package:clean_architecture_structure/features/movies/data/data.dart';
import 'package:clean_architecture_structure/features/movies/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'movies_details_event.dart';

part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationMoviesUsecase)
      : super(const MoviesDetailsState()) {
    on<GetMoviesDetailsEvent>(_getMoviesDetails);
    on<GetMoviesRecommendationEvent>(_getRecommendationMovies);
  }

  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationMoviesUsecase getRecommendationMoviesUsecase;

  FutureOr<void> _getMoviesDetails(
      GetMoviesDetailsEvent event, Emitter<MoviesDetailsState> emit) async {
    final result =
        await getMovieDetailsUsecase(MovieDetailsP(movieId: event.id));

    result.fold(
      (l) => emit(
        state.copyWith(
          moviesDetailsRequestState: RequestState.error,
          moviesDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          moviesDetailsRequestState: RequestState.loaded,
          moviesDetails: r,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendationMovies(GetMoviesRecommendationEvent event,
      Emitter<MoviesDetailsState> emit) async {
    final result = await getRecommendationMoviesUsecase(RecommendationP(id: event.id));

    // LoggerDebug.loggerDebugMessage(result);

    result.fold(
          (l) => emit(
        state.copyWith(
          recommendationsRequestState: RequestState.error,
          recommendationsMessage: l.message,
        ),
      ),
          (r) => emit(
        state.copyWith(
          recommendationsRequestState: RequestState.loaded,
          recommendations: r,
        ),
      ),
    );
  }
}
