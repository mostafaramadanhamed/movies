import 'package:dartz/dartz.dart';
import 'package:movies/core/useCase/base_use_case.dart';
import 'package:movies/movie/domain/entities/movies.dart';
import 'package:movies/movie/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase extends BaseUseCase <List<Movie>>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either< Failure ,List<Movie>>> call()async{
    return await baseMoviesRepository.getPopularMovies();
  }
}