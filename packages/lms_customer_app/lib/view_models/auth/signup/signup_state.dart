// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:lms_customer_app/config/status/loading_status.dart';
import 'package:lms_domain/domain/entities/customer_entities.dart';

class SignupState extends Equatable {
  final LoadingStatus loadingStatus;
  final String message;
  final Customer? customer;
  //
  final String username;
  final String phoneNumber;
  final String email;
  final String password;
  final String retypedPassword;

  const SignupState({
    this.loadingStatus = LoadingStatus.pure,
    this.message = '',
    this.customer,
    //
    this.username = '',
    this.phoneNumber = '',
    this.email = '',
    this.password = '',
    this.retypedPassword = '',
  });

  @override
  List<Object?> get props {
    return [
      loadingStatus,
      message,
      customer,
      username,
      phoneNumber,
      email,
      password,
      retypedPassword,
    ];
  }

  SignupState copyWith({
    LoadingStatus? loadingStatus,
    String? message,
    Customer? customer,
    String? username,
    String? phoneNumber,
    String? email,
    String? password,
    String? retypedPassword,
  }) {
    return SignupState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      message: message ?? this.message,
      customer: customer ?? this.customer,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      retypedPassword: retypedPassword ?? this.retypedPassword,
    );
  }
}
