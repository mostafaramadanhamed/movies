import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/useCase/base_use_case.dart';
import 'package:movies/movie/domain/entities/movie_details.dart';
import 'package:movies/movie/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsParams> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParams params) async {
    return await baseMoviesRepository.getMovieDetails(params);
  }

}

class MovieDetailsParams extends Equatable {
  final int movieId;

 const MovieDetailsParams({required this.movieId});

  @override
  List<Object> get props => [movieId];
}