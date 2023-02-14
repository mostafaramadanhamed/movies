import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';

import 'package:movies/movie/presentation/controller/movies_event.dart';
import 'package:movies/movie/presentation/controller/movies_states.dart';

import '../../data/datasource/movie_remote_datasource.dart';
import '../../data/repository/movies_repository.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../../domain/usecases/get_now_playing_movies.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  MoviesBloc() : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      BaseMoviesRepository baseMoviesRepository =
          MoviesRepository(baseMovieRemoteDataSource);
      final result =
          await GetNowPlayingMoviesUseCase(baseMoviesRepository).execute();
      result.fold(
        (l) => emit(
          MoviesStates(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          ),
        ),
        (r) => emit(
          MoviesStates(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
