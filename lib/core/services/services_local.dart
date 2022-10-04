import 'package:get_it/get_it.dart';
import 'package:osama2/movies/data/data_source/movie_remote_data_source.dart';
import 'package:osama2/movies/data/repository/movies_repository.dart';
import 'package:osama2/movies/domain/repository/base_movies_repository.dart';
import 'package:osama2/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:osama2/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:osama2/movies/presentation/controller/bloc/movie_details_bloc.dart';
import '../../movies/domain/usecases/get_popular_movies.dart';
import '../../movies/domain/usecases/get_recommendation_use_case.dart';
import '../../movies/domain/usecases/get_top_rated_movies.dart';
import '../../movies/presentation/controller/bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator
{
  init(){


    /// BLOC
    sl.registerFactory(() => MovieBloc(
          sl(),
          sl(),
          sl()
        ));
    
    sl.registerFactory(() => MovieDetailsBloc(
          
          
          sl(),
          sl(),
        ) );
    
    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

  /// REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));


    /// USE CASES

    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUSeCase(sl()));
   }
}