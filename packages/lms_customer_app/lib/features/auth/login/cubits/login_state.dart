// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:lms_domain/domain/entities/auth/customer.dart';

import '../../../../config/status/loading_status.dart';

class LoginState extends Equatable {
  final LoadingStatus loadingStatus;
  final Customer? customer;
  final String message;

  final String usernameOrEmail;
  final String password;

  const LoginState({
    this.loadingStatus = LoadingStatus.pure,
    this.customer,
    this.message = '',
    //
    this.usernameOrEmail = '',
    this.password = '',
  });

  @override
  List<Object?> get props => [
        loadingStatus,
        customer,
        message,
        usernameOrEmail,
        password,
      ];

  LoginState copyWith({
    LoadingStatus? loadingStatus,
    Customer? customer,
    String? message,
    String? usernameOrEmail,
    String? password,
  }) {
    return LoginState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      customer: customer ?? this.customer,
      message: message ?? this.message,
      usernameOrEmail: usernameOrEmail ?? this.usernameOrEmail,
      password: password ?? this.password,
    );
  }
}
