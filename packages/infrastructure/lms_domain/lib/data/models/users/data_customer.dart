import '../../../domain/entities/users/customer.dart';
import 'base/data_user.dart';

class DataCustomer extends DataUser {
  final String phoneNumber;
  final String displayName;
  final String affilicateCode;
  final String email;

  DataCustomer({
    required super.id,
    required super.username,
    super.password,
    required this.phoneNumber,
    required this.displayName,
    required this.affilicateCode,
    required this.email,
  });

  factory DataCustomer.fromMap(Map<String, dynamic> json) {
    return DataCustomer(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      displayName: json['displayName'],
      affilicateCode: json['affilicateCode'],
      email: json['email'],
    );
  }

  @override
  Customer toEntity() {
    return Customer(
      id: id,
      username: username,
      phoneNumber: phoneNumber,
      displayName: displayName,
      affilicateCode: affilicateCode,
      email: email,
    );
  }
}
