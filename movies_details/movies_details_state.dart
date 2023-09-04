part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final MoviesDetails? moviesDetails;
  final RequestState moviesDetailsRequestState;
  final String moviesDetailsMessage;

  final List<Recommendation>? recommendations;
  final RequestState recommendationsRequestState;
  final String recommendationsMessage;

  const MoviesDetailsState({
    this.moviesDetails,
    this.moviesDetailsRequestState = RequestState.loading,
    this.moviesDetailsMessage = '',
    this.recommendations,
    this.recommendationsRequestState = RequestState.loading,
    this.recommendationsMessage = '',
  });

  MoviesDetailsState copyWith({
    MoviesDetails? moviesDetails,
    RequestState? moviesDetailsRequestState,
    String? moviesDetailsMessage,
    List<Recommendation>? recommendations,
    RequestState? recommendationsRequestState,
    String? recommendationsMessage,
  }) {
    return MoviesDetailsState(
      moviesDetails: moviesDetails ?? this.moviesDetails,
      moviesDetailsRequestState:
          moviesDetailsRequestState ?? this.moviesDetailsRequestState,
      moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationsRequestState:
          recommendationsRequestState ?? this.recommendationsRequestState,
      recommendationsMessage:
          recommendationsMessage ?? this.recommendationsMessage,
    );
  }

  @override
  List<Object?> get props => [
        moviesDetails,
        moviesDetailsRequestState,
        moviesDetailsMessage,
        recommendations,
        recommendationsRequestState,
        recommendationsMessage,
      ];
}
