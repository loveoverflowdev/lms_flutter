import 'package:get_it/get_it.dart';
import 'package:lms_domain/data/repositories/auth/auth_repository_impl.dart';
import 'package:lms_domain/data/repositories/products/course_repository_impl.dart';
import 'package:lms_domain/domain/repositories/cart/cart_repository.dart';
import 'package:lms_domain/data/repositories/cart/cart_repository_impl.dart';
import 'package:lms_domain/domain/repositories/repositories.dart';
import 'package:lms_domain/domain/use_cases/customer/auth/customer_login_use_case.dart';
import 'package:lms_domain/domain/use_cases/customer/auth/customer_signup_use_case.dart';
import 'package:lms_domain/domain/use_cases/customer/cart/add_course_to_cart_use_case.dart';
import 'package:lms_domain/domain/use_cases/customer/cart/get_course_list_in_cart_use_case.dart';
import 'package:lms_domain/domain/use_cases/general/get_course_detail_use_case.dart';
import 'package:lms_domain/domain/use_cases/general/get_course_list_on_top_use_case.dart';

final GetIt _getIt = GetIt.instance;

final CourseRepository _courseRepository = CourseRepositoryImpl();
final AuthRepository _authRepository = AuthRepositoryImpl();
final CartRepository _cartRepository = CartRepositoryImpl();

void registerUseCases() {
  _getIt.registerSingleton(
    CustomerLoginUseCase(authRepository: _authRepository),
  );
  _getIt.registerSingleton(
    CustomerSignupUseCase(authRepository: _authRepository),
  );
  _getIt.registerSingleton(
    GetCourseListOnTopUseCase(courseRepository: _courseRepository),
  );
  _getIt.registerSingleton(
    GetCourseDetailUseCase(courseRepository: _courseRepository),
  );
  _getIt.registerSingleton(
    AddCourseToCartUseCase(cartRepository: _cartRepository),
  );
  _getIt.registerSingleton(
    GetCourseListInCartUseCase(cartRepository: _cartRepository),
  );
}
