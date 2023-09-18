import 'package:dartz/dartz.dart';

import '../../entities/products/course.dart';

abstract class CourseRepository {
  Future<Either<List<Course>, Exception>> getCourseListOnTop();
}
