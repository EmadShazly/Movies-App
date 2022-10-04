import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:osama2/core/base_use_case/base_use_case.dart';
import 'package:osama2/core/error/error.dart';
import 'package:osama2/movies/domain/entities/movie_detail.dart';
import 'package:osama2/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail,MovieDetailParameters> {


 final BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUseCase(
      this.baseMoviesRepository,
  );
  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailParameters parameter) async {
    return await baseMoviesRepository.getMovieDetails(parameter);



  }
   
  }
class MovieDetailParameters extends Equatable{



  final int movieId;

  const MovieDetailParameters({required this.movieId});
  
  @override
  
  List<Object?> get props => [movieId];
} 