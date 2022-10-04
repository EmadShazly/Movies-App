import 'package:dartz/dartz.dart';
import 'package:osama2/movies/domain/entities/moves.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/error.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>
{
final BaseMoviesRepository baseMoviesRepository;

GetTopRatedMoviesUseCase(this.baseMoviesRepository);

@override
Future<Either<Failure,List<Movie>>> call(NoParameters parameter)async{
    return await baseMoviesRepository.getTopRatedMovies();
}

}