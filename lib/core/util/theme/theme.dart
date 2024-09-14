import 'package:flutter/material.dart';
import 'package:unhcr_jobs_app/core/constant/assets.dart';
import 'package:unhcr_jobs_app/core/constant/colors.dart';
import 'package:unhcr_jobs_app/core/constant/constants.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: _appBarTheme,
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.turquoise[500]!,
      primary: AppColors.turquoise[500],
    ),
    fontFamily: AppAssets.fontFamily,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white[50],
  );

  static final AppBarTheme _appBarTheme = AppBarTheme(
    toolbarHeight: AppConstants.appBarHeight,
    scrolledUnderElevation: 0,
    titleSpacing: 20,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      color: AppColors.turquoise[950],
      fontSize: 18,
    ),
  );
}
