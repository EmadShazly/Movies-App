import 'package:equatable/equatable.dart';
import 'package:osama2/movies/domain/entities/genres.dart';

class MovieDetail extends Equatable
{
final String backdropPath;

final List<Genres> genres;
final int id;
final String overView;
final int runtime;
final String title;
final String releaseDate;
final double voteAverage;

  const MovieDetail({
    required this.genres, 
    required this.backdropPath,
    required this.id,
    required this.overView,
    required this.runtime,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
});
  
  @override
   List<Object?> get props => [
        backdropPath,
        genres,
        id,
        overView,
        runtime,
        title,
        releaseDate,
        voteAverage,
      ];

}