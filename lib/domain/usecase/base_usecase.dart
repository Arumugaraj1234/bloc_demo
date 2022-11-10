import 'package:dartz/dartz.dart';
import 'package:unit_test_app/domain/entities/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> call(In request);
}
