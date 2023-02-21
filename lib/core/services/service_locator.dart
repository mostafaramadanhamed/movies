import 'package:get_it/get_it.dart';
import 'package:movies/movie/data/datasource/movie_remote_datasource.dart';
import 'package:movies/movie/data/repository/movies_repository.dart';
import 'package:movies/movie/domain/repository/base_movies_repository.dart';
import 'package:movies/movie/domain/usecases/get_movie_details.dart';
import 'package:movies/movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/movie/domain/usecases/get_popular_movies.dart';
import 'package:movies/movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/movie/presentation/controller/details/movie_details_bloc.dart';
import 'package:movies/movie/presentation/controller/movies_bloc.dart';

final sl=GetIt.instance;
class ServicesLocator {
  void init(){
    /// bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl(),));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
    /// use case
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() =>
        MoviesRepository(sl()));
    /// Data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() =>MovieRemoteDataSource() );
  }
}