 
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osama2/core/base_use_case/base_use_case.dart';
import 'package:osama2/movies/domain/usecases/get_now_playing_movies.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/usecases/get_popular_movies.dart';
import '../../../domain/usecases/get_top_rated_movies.dart';
import 'movies_events.dart';
import 'movies_states.dart';
 
class MovieBloc extends Bloc<MoviesEvents, MoviesState> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MovieBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    // Now Playing
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

// Popular
    on<GetPopularMoviesEvent>(_getPopularMovies);

// Tp Rated
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  // Now Playing Method
  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
          nowPlayingState: RequestState.isError, nowPlayingMessage: l.message)),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.isLoaded,
        ),
      ),
    );
  }

  // popular method
  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.isError,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularState: RequestState.isLoaded,
        ),
      ),
    );
  }

  // top rated Method
  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedState: RequestState.isError,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.isLoaded,
        ),
      ),
    );
  }
}
