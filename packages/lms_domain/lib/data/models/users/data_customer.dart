import '../../../domain/entities/auth/customer.dart';
import 'base/data_user.dart';

class DataCustomer extends DataUser {
  final String phoneNumber;
  final String displayName;
  final String affilicateCode;

  DataCustomer({
    required super.id,
    required super.username,
    super.password,
    required this.phoneNumber,
    required this.displayName,
    required this.affilicateCode,
  });

  factory DataCustomer.fromMap(Map<String, dynamic> json) {
    return DataCustomer(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      displayName: json['displayName'],
      affilicateCode: json['affilicateCode'],
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
    );
  }
}
