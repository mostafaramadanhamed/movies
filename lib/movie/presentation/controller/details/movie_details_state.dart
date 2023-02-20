part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails ? movieDetails;
  final RequestState movieDetailsState;
  final String message;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.message = '',
  });

  @override
  List<Object?> get props => [
    movieDetails,
    movieDetailsState,
    message,
  ];
}
