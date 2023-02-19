import 'package:dartz/dartz.dart';
import 'package:movies/core/useCase/base_use_case.dart';
import 'package:movies/movie/domain/entities/movies.dart';
import 'package:movies/movie/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase <List<Movie>,NoParams >{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either< Failure ,List<Movie>>> call(NoParams params)async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}