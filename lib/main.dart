import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unhcr_jobs_app/app.dart';

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
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
