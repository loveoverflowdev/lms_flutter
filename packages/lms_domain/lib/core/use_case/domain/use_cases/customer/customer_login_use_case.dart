// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../../../domain/entities/auth/customer.dart';
import '../../../../../domain/repositories/auth/auth_repository.dart';
import '../../../use_case.dart';

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
