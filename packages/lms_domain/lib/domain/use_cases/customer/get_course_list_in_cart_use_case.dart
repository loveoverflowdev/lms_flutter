import 'package:dartz/dartz.dart';
import 'package:lms_domain/core/use_case/use_case.dart';

import '../../entities/products/course.dart';

class GetCourseListInCartUseCase implements UseCase<List<Course>, void> {
  @override
  Future<Either<List<Course>, Exception>> call(void params) {
    throw UnimplementedError();
  }
}
