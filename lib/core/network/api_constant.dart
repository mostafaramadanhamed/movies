class ApiConstance{
  static const  baseUrl='https://api.themoviedb.org/3';
  static const  baseImgUrl='https://image.tmdb.org/t/p/w500';
  static   String imgUrl(String path)=>'$baseImgUrl$path';
  static const  apiKey='f81159e5e91fdfdcfc0aa191026127aa';
  static const  movieNowPlayingPath='$baseUrl/movie/now_playing?api_key=$apiKey';
  static const  popularMoviesPath='$baseUrl/movie/popular?api_key=$apiKey';
  static const  topRatedMoviesPath='$baseUrl/movie/top_rated?api_key=$apiKey';
  static   movieDetailsPath(int movieId)=>'$baseUrl/movie/$movieId?api_key=$apiKey';


}