import 'package:equatable/equatable.dart';

import '../../../movie.dart';
import '/core/core.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingRequestState;
  final String nowPlayingMessage;

  final List<Movies> popularMovies;
  final RequestState popularRequestState;
  final String popularMessage;

  final List<Movies> topRatedMovies;
  final RequestState topRatedRequestState;
  final String topRatedMessage;

  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingRequestState = RequestState.loading,
      this.nowPlayingMessage = '',
      this.popularMovies = const [],
      this.popularRequestState = RequestState.loading,
      this.popularMessage = '',
      this.topRatedMovies = const [],
      this.topRatedRequestState = RequestState.loading,
      this.topRatedMessage = ''});

  MoviesState copyWith({
    List<Movies>? nowPlayingMovies,
    RequestState? nowPlayingRequestState,
    String? nowPlayingMessage,
    List<Movies>? popularMovies,
    RequestState? popularRequestState,
    String? popularMessage,
    List<Movies>? topRatedMovies,
    RequestState? topRatedRequestState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingRequestState:
          nowPlayingRequestState ?? this.nowPlayingRequestState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularRequestState: popularRequestState ?? this.popularRequestState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingRequestState,
        nowPlayingMessage,
        popularMovies,
        popularRequestState,
        popularMessage,
        topRatedMovies,
        topRatedRequestState,
        topRatedMessage
      ];
}
