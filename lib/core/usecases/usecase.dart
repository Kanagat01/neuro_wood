import 'package:dartz/dartz.dart';
import 'package:neuro_wood/core/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class VoidUseCase<Params>{
  Future<void> call(Params params);
}

class NoParams{}