import 'package:flutter/material.dart';
import 'package:lms_flutter/presentation/config/app/app.dart';

import 'presentation_locator.dart' as presentation_locator;

void run() {
  presentation_locator.registerUseCases();
  runApp(const App());
}
