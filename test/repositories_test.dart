import 'package:flutter_test/flutter_test.dart';
import 'package:lms_domain/data/repositories/products/course_repository_impl.dart';

void main() {
  test('Top Course List Test', () async {
    final repository = CourseRepositoryImpl();
    final response = await repository.getCourseListOnTop();
    prints(response);
  });
}
