import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String title ;
  final String backdropPath;
  final List<int> genderIds ;
  final String overview;
  final double voteAverage;

 const Movie({
      required this.id,
      required this.title,
      required this.backdropPath,
      required this.genderIds,
      required this.overview,
      required this.voteAverage,
      });

  @override
  List<Object?> get props => [
    id,
    title,
    backdropPath,
    genderIds,
    overview,
    voteAverage,
  ];




}