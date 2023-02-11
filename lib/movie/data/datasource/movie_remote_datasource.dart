import 'package:dio/dio.dart';
import 'package:movies/core/error/exeption.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/core/utils/constant.dart';
import 'package:movies/movie/data/models/movie_model.dart';

class MovieRemoteDataSource{
  Future<List<MovieModel>>getNowPlayingMovies()async{
  final response=  await Dio().get(
      '${AppConstance.baseUrl}/movie/now_playing?api_key=${AppConstance.apiKey}');
  if(response.statusCode==200){
    return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
  }
  else{
    throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  }
}