import 'package:dartz/dartz.dart';
import 'package:osama2/core/error/error.dart';
import 'package:osama2/core/error/exceptions.dart';
import 'package:osama2/movies/data/data_source/movie_remote_data_source.dart';
import 'package:osama2/movies/domain/entities/moves.dart';
import 'package:osama2/movies/domain/entities/movie_detail.dart';
import 'package:osama2/movies/domain/entities/recommendation.dart';
import 'package:osama2/movies/domain/repository/base_movies_repository.dart';
import 'package:osama2/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:osama2/movies/domain/usecases/get_recommendation_use_case.dart';

class MovieRepository extends BaseMoviesRepository
{

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async {
    


   final result= await baseMovieRemoteDataSource.getMoviesNowPlaying();

try {
      
 return Right(result);
} on ServerException catch (failure) {
      return
      Left(ServerFailure(failure.errorMessageModel.statusMessage));
}

    
   }
   
     @override
     Future<Either<Failure, List<Movie>>> getPopularMovies()async {
      final result =await baseMovieRemoteDataSource.getPopularMovies();
try{
  return Right(result);
} on ServerException catch(failure){
  return Left(ServerFailure(failure.errorMessageModel.statusMessage));
}



      }
   
     @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();



    try {
      return Right(result);
      
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      
    }
      }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailParameters parameters )async {
    final result= await baseMovieRemoteDataSource.getMovieDetails(parameters);

try {
      
 return Right(result);
} on ServerException catch (failure) {
      return
      Left(ServerFailure(failure.errorMessageModel.statusMessage));
}

 }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameter parameter) async{
    final result= await baseMovieRemoteDataSource.getRecommendationMovies(parameter);

try {
      
 return Right(result);
} on ServerException catch (failure) {
      return
      Left(ServerFailure(failure.errorMessageModel.statusMessage));
}
  }}