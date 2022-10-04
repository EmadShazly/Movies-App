import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osama2/core/utils/enums.dart';
import 'package:osama2/movies/domain/entities/movie_detail.dart';
import 'package:osama2/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:osama2/movies/domain/usecases/get_recommendation_use_case.dart';

import '../../../domain/entities/recommendation.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getRecommendationUdeCase): super( MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUSeCase getRecommendationUdeCase;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async{
final result = await getMovieDetailsUseCase(MovieDetailParameters(
      movieId: event.id,
    ));

result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestState.isError,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetail: r,
              movieDetailsState: RequestState.isLoaded,
            )));
 
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit)async {


    final result = await getRecommendationUdeCase(RecommendationParameter(
      event.id
    ),
    );

result.fold(
        (l) => emit(state.copyWith(
              recommendationState: RequestState.isError,
              recommendationMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              recommendation: r,
              recommendationState: RequestState.isLoaded,
            )));

  }
}
