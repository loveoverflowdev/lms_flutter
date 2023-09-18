import 'package:dartz/dartz.dart';
import 'package:lms_flutter/data/models/products/data_course.dart';
import 'package:lms_flutter/data/sources/remote/resources/api_uris.dart';
import 'package:lms_flutter/domain/repositories/products/course_repository.dart';

import '../../../domain/entities/products/course.dart';
import '../../sources/remote/network_service_mixin.dart';

class CourseRepositoryImpl
    with NetworkServiceMixin
    implements CourseRepository {
  @override
  Future<Either<List<Course>, Exception>> getCourseListOnTop() async {
    final response = await get(ApiUris.topCourseListUrl);
    return response.bimap(
      (l) {
        final objects = l['data'];
        return objects is Iterable
            ? objects.map((e) => DataCourse.fromMap(e).toEntity()).toList()
            : [];
      },
      (r) => r,
    );
  }
}
