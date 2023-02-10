import 'package:movies/movie/domain/entities/movies.dart';

abstract class BaseMoviesRepository{
  Future<List<Movie>>getNowPlaying();
  Future<List<Movie>>getPopularMovies();
  Future<List<Movie>>getTopRatedMovies();
}