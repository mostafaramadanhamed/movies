class Movies{
  final int id;
  final String title ;
  final String backdropPath;
  final List<int> genderIds ;
  final String overview;
  final double voteAverage;

  Movies({
      required this.id,
      required this.title,
      required this.backdropPath,
      required this.genderIds,
      required this.overview,
      required this.voteAverage,
      });
}