// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:lms_domain/core/use_case/use_case.dart';
import 'package:lms_domain/data/repositories/repositories.dart';

import '../../entities/products/course.dart';

class GetCourseDetailParams {
  final String id;
  GetCourseDetailParams({
    required this.id,
  });
}

class GetCourseDetailUseCase implements UseCase<Course, GetCourseDetailParams> {
  final CourseRepository _courseRepository;

  GetCourseDetailUseCase({required CourseRepository courseRepository})
      : _courseRepository = courseRepository;
  @override
  Future<Either<Course, Exception>> call(GetCourseDetailParams params) {
    return _courseRepository.getCourse(params.id);
  }
}
