import 'package:flutter/material.dart';

import 'colors/app_colors.dart';

class AppThemes {
  static final primary = ThemeData(
    primarySwatch: AppColors.blue,
    scaffoldBackgroundColor: AppColors.lotion,
    dividerColor: AppColors.grayX11,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.black87,
      ),
      iconTheme: IconThemeData(
        color: AppColors.black87,
      ),
    ),
  );
}
