import 'package:dio/dio.dart';
import 'package:osama2/core/network/api_constance.dart';
import 'package:osama2/core/network/error_message_model.dart';
import 'package:osama2/movies/data/model/detail_model.dart';
import 'package:osama2/movies/data/model/movie_model.dart';
import 'package:osama2/movies/data/model/recommendation_model.dart';
import 'package:osama2/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:osama2/movies/domain/usecases/get_recommendation_use_case.dart';
import '../../../core/error/exceptions.dart';


// Base class

abstract class BaseMovieRemoteDataSource
{
  Future<List<MovieModel>> getMoviesNowPlaying();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel> getMovieDetails(MovieDetailParameters parameters);
  Future<List<RecommendationModel>> getRecommendationMovies(
      RecommendationParameter parameters);
}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource
{
// Now playing
 @override
  Future<List<MovieModel>> getMoviesNowPlaying()
  async {
    final response = await Dio().get(
      ApiConstance.nowPlayingMoviesPath,
    );

 if(response.statusCode==200){

      return List<MovieModel>.from(
          (response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
 }else{

throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));

 }
  }
  // popular
  @override
  Future<List<MovieModel>> getPopularMovies() 
      
  
  async {
    final response = await Dio().get(
      ApiConstance.popularMoviesPath,
    );


   
if(response.statusCode==200){

      return List<MovieModel>.from(
          (response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
 }else{

throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));

 
  }

   }
  //  top Rated
     @override
     Future<List<MovieModel>> getTopRatedMovies() 
       
   async {
    final response = await Dio().get(
      ApiConstance.topRatedMoviesPath,
    );
if(response.statusCode==200){

      return List<MovieModel>.from(
          (response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
 }else{

throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));

 }
  }
  // Details
  @override
  Future<MovieDetailModel> getMovieDetails(MovieDetailParameters parameters) async{
        final response = await Dio().get(
      ApiConstance.movieDetailsPath(parameters.movieId),
    );

 if(response.statusCode==200){

      return  MovieDetailModel.fromJson(response.data);
 }else{

throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));

 }

    
  
  }
  // Recommendation
  @override
  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationParameter parameters) async{
            final response = await Dio().get(
      ApiConstance.movieRecommendationPath(parameters.id),
    );

 if(response.statusCode==200){

       return List<RecommendationModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
 }else{

throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));

 }

   }

     
     }

