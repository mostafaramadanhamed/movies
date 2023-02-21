import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exeption.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movie/domain/entities/movie_details.dart';
import 'package:movies/movie/domain/entities/movies.dart';
import 'package:movies/movie/domain/entities/recommendations.dart';
import 'package:movies/movie/domain/repository/base_movies_repository.dart';
import 'package:movies/movie/domain/usecases/get_movie_details.dart';
import 'package:movies/movie/domain/usecases/get_recommendation.dart';

import '../datasource/movie_remote_datasource.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either< Failure ,List<Movie>>> getNowPlayingMovies() async{
    final  result= await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either< Failure ,List<Movie>>> getPopularMovies()async  {
    final  result= await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either< Failure ,List<Movie>>> getTopRatedMovies()async {
    final  result= await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParams params) async{
    final  result= await baseMovieRemoteDataSource.getMovieDetails(params);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParams params) async{
    final result= await baseMovieRemoteDataSource.getRecommendation(params);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}