import 'package:dartz/dartz.dart';

import '../../../core/use_case/use_case.dart';
import '../../entities/products/course.dart';
import '../../repositories/products/course_repository.dart';

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
