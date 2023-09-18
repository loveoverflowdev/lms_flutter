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

  factory Customer.fromMap(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      displayName: json['displayName'],
      affilicateCode: json['affilicateCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'phoneNumber': phoneNumber,
      'displayName': displayName,
      'affilicateCode': affilicateCode,
    };
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
