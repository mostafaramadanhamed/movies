import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movie/presentation/controller/movies_event.dart';
import 'package:movies/movie/presentation/controller/movies_states.dart';
import '../../domain/usecases/get_now_playing_movies.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {

      final result =
          await getNowPlayingMoviesUseCase.execute();
      result.fold(
        (l) => emit(
          MoviesState(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          ),
        ),
        (r) => emit(
          MoviesState(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
