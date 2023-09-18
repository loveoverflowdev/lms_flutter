import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:lms_flutter/domain/use_cases/customer/customer_login_use_case.dart';

import 'package:lms_flutter/presentation/config/app/presentation_locator.dart'
    as presentation_locator;

void main() {
  presentation_locator.registerUseCases();
  test('Customer Login  Test', () async {
    final customerLoginUseCase = GetIt.instance.get<CustomerLoginUseCase>();
    final customer = await customerLoginUseCase.call(
      CustomerLoginParams(usernameOrEmail: '321', password: '321'),
    );
    prints(customer);
  });
}
