import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movie/presentation/controller/movies_event.dart';
import 'package:movies/movie/presentation/controller/movies_states.dart';
import '../../domain/usecases/get_now_playing_movies.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {

      final result =
          await getNowPlayingMoviesUseCase.execute();
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
