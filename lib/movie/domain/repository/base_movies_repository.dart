import 'package:dartz/dartz.dart';
import 'package:movies/movie/domain/entities/movie_details.dart';
import 'package:movies/movie/domain/entities/movies.dart';
import 'package:movies/movie/domain/usecases/get_movie_details.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository{

  Future<Either< Failure ,List<Movie>>>getNowPlayingMovies();
  Future<Either< Failure ,List<Movie>>>getPopularMovies();
  Future<Either< Failure ,List<Movie>>>getTopRatedMovies();
  Future<Either< Failure ,MovieDetails>>getMovieDetails(MovieDetailsParams params);
  Future<Either< Failure ,MovieDetails>>getRecommendation();
}