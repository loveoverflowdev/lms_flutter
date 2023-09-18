import 'package:dartz/dartz.dart';
import 'package:lms_domain/domain/entities/auth/customer_login_result.dart';
import 'package:lms_domain/domain/entities/auth/customer_signup_result.dart';

import '../../../domain/repositories/auth/auth_repository.dart';
import '../../models/users/data_customer.dart';
import '../../sources/remote/network_service_mixin.dart';
import '../../sources/remote/resources/api_uris.dart';

class AuthRepositoryImpl with NetworkServiceMixin implements AuthRepository {
  @override
  Future<Either<CustomerLoginResult, Exception>> customerLogIn({
    required String usernameOrEmail,
    required String password,
  }) async {
    final response = await post(
      ApiUris.customerLoginUrl,
      data: {
        "usernameOrEmail": usernameOrEmail,
        "password": password,
      },
    );
    return response.bimap(
      (l) {
        final customer = DataCustomer.fromMap(l['data']).toEntity();
        final tokens = l['tokens'];
        final accessToken = tokens['accessToken'];
        final refreshToken = tokens['refreshToken'] ?? '';
        return CustomerLoginResult(
          customer: customer,
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
      },
      (r) => r,
    );
  }

  @override
  Future<Either<CustomerSignupResult, Exception>> customerSignUp({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  }) {
    // TODO: implement customerSignUp
    throw UnimplementedError();
  }
}
