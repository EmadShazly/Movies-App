import 'package:osama2/movies/data/model/genres_model.dart';
import 'package:osama2/movies/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail{
 const MovieDetailModel({
    required super.genres,
    required super.backdropPath,
    required super.id,
    required super.overView,
    required super.runtime,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
  });


  factory MovieDetailModel.fromJson(Map<String,dynamic> json){

return MovieDetailModel(
      genres: List<GenresModel>.from(
          json['genres'].map((x) => GenresModel.fromJson(x))),
 backdropPath: json['backdrop_path'],
  id: json['id'], 
  overView:  json['overview'],
   runtime: json['runtime'],
    title: json['title'],
     releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
);



  }
}