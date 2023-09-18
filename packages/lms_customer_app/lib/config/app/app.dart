import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../texts/localized_texts.dart';
import '../theme/app_theme.dart';
import 'app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: LocalizedTexts.app,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.primary,
      routerConfig: AppRouter.router,
      builder: EasyLoading.init(),
    );
  }
}
