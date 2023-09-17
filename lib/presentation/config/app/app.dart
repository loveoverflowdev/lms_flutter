import 'package:flutter/material.dart';
import 'package:lms_flutter/presentation/config/app/app_router.dart';
import 'package:lms_flutter/presentation/config/texts/localized_texts.dart';

import '../theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: LocalizedTexts.app,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.primary,
      routerConfig: AppRouter.router,
    );
  }
}
