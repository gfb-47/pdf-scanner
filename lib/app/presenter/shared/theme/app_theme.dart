import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get defaultTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.whiteAlt,
        iconTheme: IconThemeData(color: AppColors.primary),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: true,
        ),
      );
}
