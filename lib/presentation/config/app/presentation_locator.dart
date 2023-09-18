import 'package:get_it/get_it.dart';
import 'package:lms_flutter/domain/repositories/auth/auth_repository.dart';
import 'package:lms_flutter/domain/repositories/products/course_repository.dart';
import 'package:lms_flutter/domain/use_cases/customer/customer_login_use_case.dart';
import 'package:lms_flutter/domain/use_cases/general/get_course_list_on_top_use_case.dart';

import '../../../data/repositories/auth/auth_repository_impl.dart';
import '../../../data/repositories/products/course_repository_impl.dart';

final GetIt _getIt = GetIt.instance;

final CourseRepository _courseRepository = CourseRepositoryImpl();
final AuthRepository _authRepository = AuthRepositoryImpl();

void registerUseCases() {
  _getIt.registerSingleton(
    CustomerLoginUseCase(authRepository: _authRepository),
  );
  _getIt.registerSingleton(
    GetCourseListOnTopUseCase(courseRepository: _courseRepository),
  );
}
