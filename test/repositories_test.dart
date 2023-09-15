import 'package:flutter_test/flutter_test.dart';
import 'package:lms_flutter/data/repositories/course_repository_impl.dart';

void main() {
  test('Top Course List Test', () async {
    final repository = CourseRepositoryImpl();
    final response = await repository.getCourseListOnTop();
    response.bimap(
      (l) => print(l),
      (r) => print(r),
    );
  });
}
