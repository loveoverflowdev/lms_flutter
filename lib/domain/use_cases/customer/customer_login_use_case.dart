// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:lms_flutter/core/use_case/use_case.dart';
import 'package:lms_flutter/domain/repositories/auth/auth_repository.dart';

import '../../entities/auth/customer.dart';

class CustomerLoginParams {
  final String usernameOrEmail;
  final String password;

  CustomerLoginParams({
    required this.usernameOrEmail,
    required this.password,
  });
}

class CustomerLoginUseCase extends UseCase<Customer, CustomerLoginParams> {
  final AuthRepository _authRepository;

  CustomerLoginUseCase({
    required final AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Customer, Exception>> call(CustomerLoginParams params) {
    return _authRepository.customerLogIn(
      usernameOrEmail: params.usernameOrEmail,
      password: params.password,
    );
  }
}
