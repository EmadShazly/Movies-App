 
import 'package:equatable/equatable.dart';

class Movie extends Equatable
{
final int id;
final String title;
final String backDropPath;
final List<int> genreIds;
final double voteAverage;
final String releaseDate;
final String overView;
 const Movie({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.genreIds,
    required this.voteAverage,
    required this.overView,
    required this.releaseDate,  
});

  @override
  List<Object?> get props => [
        id,
        title,
        backDropPath,
        genreIds,
        voteAverage,
        overView,
        releaseDate
      ];
 
}
