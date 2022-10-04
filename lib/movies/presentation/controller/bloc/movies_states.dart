import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/moves.dart';
 class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
   final String nowPlayingMessage;
   final RequestState nowPlayingState;
   final List<Movie> popularMovies;
   final String popularMessage;
   final RequestState popularState;
   final List<Movie> topRatedMovies;
   final String topRatedMessage;
   final RequestState topRatedState;



  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMessage='',
    this.nowPlayingState=RequestState.isLoading,  
    this.popularMovies = const [],
    this.popularMessage='',
    this.popularState=RequestState.isLoading,  
    this.topRatedMovies = const [],
    this.topRatedMessage='',
    this.topRatedState=RequestState.isLoading,  
});



MoviesState copyWith({
     List<Movie>? nowPlayingMovies,
     String? nowPlayingMessage,
     RequestState? nowPlayingState,
     List<Movie>? popularMovies,
     String? popularMessage,
     RequestState? popularState,
     List<Movie>? topRatedMovies,
     String? topRatedMessage,
     RequestState? topRatedState,



}){
  return  MoviesState(

nowPlayingMovies:nowPlayingMovies?? this.nowPlayingMovies,
nowPlayingMessage:nowPlayingMessage?? this.nowPlayingMessage,
nowPlayingState:nowPlayingState?? this.nowPlayingState,
popularMovies:popularMovies?? this.popularMovies,
popularMessage: popularMessage ?? this.popularMessage,
popularState:popularState?? this.popularState,
topRatedMovies:topRatedMovies?? this.topRatedMovies,
topRatedMessage:topRatedMessage?? this.topRatedMessage,
topRatedState:topRatedState?? this.topRatedState,

  );
}


 
  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage,
      ];
}
