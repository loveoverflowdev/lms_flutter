import 'package:get_it/get_it.dart';
import 'package:lms_domain/data/repositories/repositories.dart';
import 'package:lms_domain/domain/use_cases/customer_use_cases.dart';
import 'package:lms_domain/domain/use_cases/general_use_cases.dart';

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
