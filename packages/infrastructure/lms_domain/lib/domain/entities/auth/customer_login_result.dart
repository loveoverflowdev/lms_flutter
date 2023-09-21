import '../users/customer.dart';

class CustomerLoginResult {
  final Customer customer;
  final String accessToken;
  final String refreshToken;

  CustomerLoginResult({
    required this.customer,
    required this.accessToken,
    this.refreshToken = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customer': customer.toMap(),
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory CustomerLoginResult.fromMap(Map<String, dynamic> map) {
    return CustomerLoginResult(
      customer: Customer.fromMap(map['customer'] as Map<String, dynamic>),
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }
}
