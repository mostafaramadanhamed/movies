import 'package:movies/movie/domain/entities/recommendations.dart';

class RecommendationModel extends Recommendation{
  const RecommendationModel({
     super.backdropPath,
    required super.id});

  factory RecommendationModel.fromJson(Map<String,dynamic>json){
    return RecommendationModel(
        backdropPath: json['backdrop_path']??'/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
        id: json['id'],
    );
  }
}