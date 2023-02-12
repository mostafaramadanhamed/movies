import 'package:dio/dio.dart';
import 'package:movies/core/error/exeption.dart';
import 'package:movies/core/network/api_constant.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/movie/data/models/movie_model.dart';
abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>>getNowPlayingMovies();
  Future<List<MovieModel>>getPopularMovies();
  Future<List<MovieModel>>getTopRatedMovies();
}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>>getNowPlayingMovies()async{
  final response=  await Dio().get(
      ApiConstance.movieNowPlayingPath);
  if(response.statusCode==200){
    return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
  }
  else{
    throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response=  await Dio().get(
        ApiConstance.popularMoviesPath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<MovieModel>> getTopRatedMovies()async {

    final response=  await Dio().get(
        ApiConstance.topRatedMoviesPath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}