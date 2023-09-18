// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:lms_domain/domain/entities/auth/customer_login_result.dart';

import '../../config/status/loading_status.dart';

class LoginState extends Equatable {
  bool get isAuthoried => loginResult?.accessToken.isNotEmpty == true;
  final LoadingStatus loadingStatus;
  final CustomerLoginResult? loginResult;
  final String message;

  final String usernameOrEmail;
  final String password;

  const LoginState({
    this.loadingStatus = LoadingStatus.pure,
    this.loginResult,
    this.message = '',
    //
    this.usernameOrEmail = '',
    this.password = '',
  });

  @override
  List<Object?> get props => [
        loadingStatus,
        loginResult,
        message,
        usernameOrEmail,
        password,
      ];

  LoginState copyWith({
    LoadingStatus? loadingStatus,
    CustomerLoginResult? loginResult,
    String? message,
    String? usernameOrEmail,
    String? password,
  }) {
    return LoginState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      loginResult: loginResult ?? this.loginResult,
      message: message ?? this.message,
      usernameOrEmail: usernameOrEmail ?? this.usernameOrEmail,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loginResult': loginResult?.toMap(),
      'message': message,
      'usernameOrEmail': usernameOrEmail,
      'password': password,
    };
  }

  factory LoginState.fromMap(Map<String, dynamic> map) {
    return LoginState(
      loadingStatus: LoadingStatus.pure,
      loginResult: map['loginResult'] != null
          ? CustomerLoginResult.fromMap(map['loginResult'])
          : null,
      message: map['message'] as String,
      usernameOrEmail: map['usernameOrEmail'] as String,
      password: map['password'] as String,
    );
  }
}
