import 'package:dartz/dartz.dart';

import '../../entities/auth/customer_login_result.dart';
import '../../entities/auth/customer_signup_result.dart';

abstract class AuthRepository {
  Future<Either<CustomerLoginResult, Exception>> customerLogIn({
    required String usernameOrEmail,
    required String password,
  });

  Future<Either<CustomerSignupResult, Exception>> customerSignUp({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  });
}
