import 'package:movies/movie/domain/entities/recommendations.dart';

class RecommendationModel extends Recommendation{
  const RecommendationModel({
    required super.backdropPath,
    required super.id});

  factory RecommendationModel.fromJson(Map<String,dynamic>json){
    return RecommendationModel(
        backdropPath: json['backdrop_path'],
        id: json['id'],
    );
  }
}