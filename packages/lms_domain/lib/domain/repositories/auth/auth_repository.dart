import 'package:dartz/dartz.dart';

import '../../entities/auth/customer.dart';

abstract class AuthRepository {
  Future<Either<Customer, Exception>> customerLogIn({
    required String usernameOrEmail,
    required String password,
  });

  Future<Either<Customer, Exception>> customerSignUp({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  });
}
