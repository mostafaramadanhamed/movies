import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';

import '../../domain/entities/movies.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String messageError;

  const MoviesStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.messageError = '',
  });
  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        messageError,
      ];
}
