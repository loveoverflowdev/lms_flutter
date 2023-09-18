import 'package:dartz/dartz.dart';
import 'package:lms_flutter/domain/entities/products/course.dart';
import 'package:lms_flutter/domain/repositories/products/course_repository.dart';

import '../../../core/use_case/use_case.dart';

class GetCourseListOnTopUseCase implements UseCase<List<Course>, void> {
  final CourseRepository _courseRepository;

  GetCourseListOnTopUseCase({
    required final CourseRepository courseRepository,
  }) : _courseRepository = courseRepository;

  @override
  Future<Either<List<Course>, Exception>> call(params) {
    return _courseRepository.getCourseListOnTop();
  }
}
