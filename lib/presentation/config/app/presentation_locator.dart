import 'package:get_it/get_it.dart';
import 'package:lms_flutter/domain/repositories/course_repository.dart';
import 'package:lms_flutter/domain/use_cases/get_course_list_on_top_use_case.dart';

import '../../../data/repositories/course_repository_impl.dart';

final GetIt _getIt = GetIt.instance;

final CourseRepository _courseRepository = CourseRepositoryImpl();

void registerUseCases() {
  _getIt.registerSingleton(
    GetCourseListOnTopUseCase(courseRepository: _courseRepository),
  );
}
