import 'package:osama2/movies/domain/entities/moves.dart';

class MovieModel extends Movie{
  const MovieModel({
    required super.id,
    required super.title,
    required super.backDropPath,
    required super.genreIds,
    required super.voteAverage,
    required super.overView,
    required super.releaseDate,  
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>

  MovieModel(
        id: json['id'],
        title: json['title'],
        backDropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
         
    
         voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
        overView: json['overview'],
        
    
        
       );

 }