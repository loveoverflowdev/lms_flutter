import 'package:flutter/material.dart';
import 'package:lms_flutter/presentation/config/texts/localized_texts.dart';

import 'config/theme/app_theme.dart';
import 'features/home/views/home_page.dart';

class LmsApp extends StatelessWidget {
  const LmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LocalizedTexts.app,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.primary,
      // builder: DevicePreview.appBuilder,
      // locale: DevicePreview.locale(context),
      home: const HomePage(),
    );
  }
}
