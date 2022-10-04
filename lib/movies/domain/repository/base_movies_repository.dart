import 'package:dartz/dartz.dart';
import 'package:osama2/movies/domain/entities/recommendation.dart';
import 'package:osama2/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:osama2/movies/domain/usecases/get_recommendation_use_case.dart';

import '../../../core/error/error.dart';
import '../entities/moves.dart';
import '../entities/movie_detail.dart';

abstract class BaseMoviesRepository
{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameter parameter);
} 