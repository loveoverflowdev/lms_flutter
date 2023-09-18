import 'base/user.dart';

class Customer extends User {
  final String phoneNumber;
  final String displayName;
  final String affilicateCode;

  Customer({
    required super.id,
    required super.username,
    super.password,
    required this.phoneNumber,
    required this.displayName,
    required this.affilicateCode,
  });

  Customer fromMap(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      displayName: json['displayName'],
      affilicateCode: json['affilicateCode'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        username,
        phoneNumber,
        displayName,
        password,
        phoneNumber,
        affilicateCode,
      ];
}
