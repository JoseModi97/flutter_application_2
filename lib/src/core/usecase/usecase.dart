import 'package:dartz/dartz.dart' as dartz;
import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/src/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<dartz.Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
