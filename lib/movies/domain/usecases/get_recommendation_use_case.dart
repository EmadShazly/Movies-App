import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:osama2/core/base_use_case/base_use_case.dart';
import 'package:osama2/core/error/error.dart';
import 'package:osama2/movies/domain/entities/recommendation.dart';
import 'package:osama2/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationUSeCase extends BaseUseCase<List<Recommendation>, RecommendationParameter > {

final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUSeCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameter parameter) async {
    return await baseMoviesRepository.getRecommendation(parameter);
    
  }
}

class RecommendationParameter extends Equatable{
  final int id;

 const RecommendationParameter(this.id);
  
  @override
   
  List<Object?> get props =>[id];
}