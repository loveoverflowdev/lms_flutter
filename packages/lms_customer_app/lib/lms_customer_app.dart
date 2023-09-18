library lms_customer_app;

import 'package:flutter/widgets.dart';
import 'config/app/app.dart';
import 'config/app/locator.dart' as locator;

void runLmsCustomerApp() {
  locator.registerUseCases();
  runApp(const App());
}
