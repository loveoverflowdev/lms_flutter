import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Type, Exception>> call(Params params);
}
