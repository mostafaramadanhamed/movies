import 'package:dartz/dartz.dart';
import 'package:movies/movie/domain/entities/movies.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository{

  Future<Either< Failure ,List<Movie>>>getNowPlayingMovies();
  Future<Either< Failure ,List<Movie>>>getPopularMovies();
  Future<Either< Failure ,List<Movie>>>getTopRatedMovies();
}