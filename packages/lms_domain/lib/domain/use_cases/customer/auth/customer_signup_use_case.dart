// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:lms_domain/core/use_case/use_case.dart';

import '../../../entities/auth/customer_signup_result.dart';
import '../../../repositories/auth/auth_repository.dart';

class CustomerSignupParams {
  final String username;
  final String phoneNumber;
  final String email;
  final String password;

  CustomerSignupParams({
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });
}

class CustomerSignupUseCase
    implements UseCase<CustomerSignupResult, CustomerSignupParams> {
  final AuthRepository _authRepository;

  CustomerSignupUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<CustomerSignupResult, Exception>> call(
      CustomerSignupParams params) {
    return _authRepository.customerSignUp(
      username: params.username,
      email: params.email,
      password: params.password,
      phoneNumber: params.phoneNumber,
    );
  }
}
