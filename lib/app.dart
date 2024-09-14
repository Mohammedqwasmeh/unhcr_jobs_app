import 'package:flutter/material.dart';
import 'package:unhcr_jobs_app/core/routes/router.gr.dart';
import 'package:unhcr_jobs_app/core/util/theme/theme.dart';

class UNHCRJobsApp extends StatelessWidget {
  UNHCRJobsApp({
    super.key,
  });

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(
        initialRoutes: [
          NavigationRoute(),
        ],
      ),
      darkTheme: AppTheme.lightTheme,
      themeMode: ThemeMode.dark,
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
