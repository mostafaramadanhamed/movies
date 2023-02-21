import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/useCase/base_use_case.dart';
import 'package:movies/movie/domain/entities/recommendations.dart';
import 'package:movies/movie/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>, RecommendationParams> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParams params)async {
    return await baseMoviesRepository.getRecommendation(params);
  }

}

class RecommendationParams extends Equatable {
  final int id;

 const RecommendationParams(this.id);

  @override
  List<Object> get props => [id];
}