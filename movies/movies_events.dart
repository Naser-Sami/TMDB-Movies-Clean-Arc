import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  const MoviesEvents();

  @override
  List<Object?> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvents {

  @override
  List<Object?> get props => [];
}

class GetPopularMoviesEvent extends MoviesEvents {

  @override
  List<Object?> get props => [];
}

class GetTopRatedMoviesEvent extends MoviesEvents {

  @override
  List<Object?> get props => [];
}