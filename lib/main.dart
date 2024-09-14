import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unhcr_jobs_app/app.dart';
import 'package:unhcr_jobs_app/core/constant/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _configSystemChrome();

  runApp(
    UNHCRJobsApp(),
  );
}

void _configSystemChrome() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.grey[500],
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
}
