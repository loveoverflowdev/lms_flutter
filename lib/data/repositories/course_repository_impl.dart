import 'package:dartz/dartz.dart';
import 'package:lms_flutter/data/models/products/data_course.dart';
import 'package:lms_flutter/data/sources/remote/resources/api_uris.dart';

import '../sources/remote/network_service_mixin.dart';

class CourseRepositoryImpl with NetworkServiceMixin {
  Future<Either<List<DataCourse>, Exception>> getCourseListOnTop() async {
    final response = await get(ApiUris.topCourseListUrl);
    return response.bimap(
      (l) {
        final objects = l['data'];
        return objects is Iterable
            ? objects.map((e) => DataCourse.fromMap(e)).toList()
            : [];
      },
      (r) => r,
    );
  }
}
