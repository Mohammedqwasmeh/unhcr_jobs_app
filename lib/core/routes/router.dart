import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:unhcr_jobs_app/core/navigation/navigation_page.dart';
import 'package:unhcr_jobs_app/features/about/page/about_page.dart';
import 'package:unhcr_jobs_app/features/home/page/home_page.dart';
import 'package:unhcr_jobs_app/features/vacancy_details/page/job_details_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CustomRoute(
      path: '/',
      page: NavigationPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      children: [
        AutoRoute(
          initial: true,
          path: 'home',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            CustomRoute(
              initial: true,
              path: 'Home',
              page: HomePage,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
            CustomRoute(
              path: 'Job Details',
              page: JobDetailsPage,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
          ],
        ),
        AutoRoute(
          path: 'About',
          page: AboutPage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
