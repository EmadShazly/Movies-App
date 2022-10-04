import 'dart:convert';

import 'package:osama2/movies/domain/entities/recommendation.dart';

 
class RecommendationModel extends Recommendation{
  const RecommendationModel({
    required super.backdropPath,
    required super.id,
  });

factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      backdropPath: json['backdrop_path'] ??'/ugS5FVfCI3RV0ZwZtBV3HAV75OX.jpg',
       id: json['id'],
    );
 }


}