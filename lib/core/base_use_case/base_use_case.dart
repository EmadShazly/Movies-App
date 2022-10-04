import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:osama2/core/error/error.dart';

abstract class BaseUseCase<T,parameter>
{
  Future <Either<Failure,T>> call(parameter parameter);
} 


class NoParameters extends Equatable
{
  const NoParameters();
  @override
  
  List<Object?> get props => [];

}