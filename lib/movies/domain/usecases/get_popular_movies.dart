import 'package:dartz/dartz.dart';
import 'package:osama2/core/base_use_case/base_use_case.dart';
import 'package:osama2/movies/domain/entities/moves.dart';
import 'package:osama2/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/error.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>
{
final   BaseMoviesRepository baseMoviesRepository;
GetPopularMoviesUseCase(this.baseMoviesRepository);




@override
  Future<Either<Failure,List<Movie>>> call(NoParameters parameter)async{
  return await baseMoviesRepository.getPopularMovies();
}

}