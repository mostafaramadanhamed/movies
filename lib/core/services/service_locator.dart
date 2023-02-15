import 'package:get_it/get_it.dart';
import 'package:movies/movie/data/datasource/movie_remote_datasource.dart';
import 'package:movies/movie/data/repository/movies_repository.dart';
import 'package:movies/movie/domain/repository/base_movies_repository.dart';
import 'package:movies/movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/movie/presentation/controller/movies_bloc.dart';

final sl=GetIt.instance;
class ServicesLocator {
  void init(){
    /// bloc
    sl.registerFactory(() => MoviesBloc(sl()));
    /// use case
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() =>
        MoviesRepository(sl()));
    /// Data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() =>MovieRemoteDataSource() );
  }
}