// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../../core/use_case/use_case.dart';
import '../../../entities/auth/customer_login_result.dart';
import '../../../repositories/auth/auth_repository.dart';

class CustomerLoginParams {
  final String usernameOrEmail;
  final String password;

  CustomerLoginParams({
    required this.usernameOrEmail,
    required this.password,
  });
}

class CustomerLoginUseCase
    extends UseCase<CustomerLoginResult, CustomerLoginParams> {
  final AuthRepository _authRepository;

  CustomerLoginUseCase({
    required final AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<CustomerLoginResult, Exception>> call(
      CustomerLoginParams params) {
    return _authRepository.customerLogIn(
      usernameOrEmail: params.usernameOrEmail,
      password: params.password,
    );
  }
}
