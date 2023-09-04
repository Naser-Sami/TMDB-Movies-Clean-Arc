import 'dart:async';

import 'package:clean_architecture_structure/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movie.dart';
import 'movies_events.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  // now playing
  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    // LoggerDebug.loggerInformationMessage(sl<GetNowPlayingMoviesUsecase>().hashCode);
    // final result = await getNowPlayingMoviesUsecase.execute();
    final result = await getNowPlayingMoviesUsecase(const NoP());
    // emit(const MoviesState(nowPlayingRequestState: RequestState.loaded));

    // LoggerDebug.loggerDebugMessage(result);
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingRequestState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingRequestState: RequestState.loaded,
          nowPlayingMovies: r,
        ),
      ),
    );
  }

  // popular
  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUsecase(const NoP());

    result.fold(
      (l) => emit(
        state.copyWith(
          popularRequestState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularRequestState: RequestState.loaded,
          popularMovies: r,
        ),
      ),
    );
  }

  // top rated
  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUsecase(const NoP());

    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedRequestState: RequestState.error,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedRequestState: RequestState.loaded,
          topRatedMovies: r,
        ),
      ),
    );
  }
}
