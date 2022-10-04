class ApiConstance
{
  static const String baseUrl='https://api.themoviedb.org/3';
  static const String apiKey = '5b1d23b9eff312bc9549533985899d58';
   static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
  static  String movieDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';
      static  String movieRecommendationPath(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String urlImage(String path) => '$baseImageUrl$path';
}
