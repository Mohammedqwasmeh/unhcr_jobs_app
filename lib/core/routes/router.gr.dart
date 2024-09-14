// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i7;

import '../../features/about/page/about_page.dart' as _i3;
import '../../features/home/model/job.dart' as _i8;
import '../../features/home/page/home_page.dart' as _i4;
import '../../features/vacancy_details/page/job_details_page.dart' as _i5;
import '../navigation/navigation_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    NavigationRoute.name: (routeData) {
      final args = routeData.argsAs<NavigationRouteArgs>(
          orElse: () => const NavigationRouteArgs());
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.NavigationPage(
          key: args.key,
          activeIndex: args.activeIndex,
        ),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    AboutRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AboutPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    JobDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<JobDetailsRouteArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.JobDetailsPage(
          job: args.job,
          key: args.key,
        ),
        transitionsBuilder: _i6.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          NavigationRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              '#redirect',
              path: '',
              parent: NavigationRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i6.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i6.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: HomeRouter.name,
                  redirectTo: 'Home',
                  fullMatch: true,
                ),
                _i6.RouteConfig(
                  HomeRoute.name,
                  path: 'Home',
                  parent: HomeRouter.name,
                ),
                _i6.RouteConfig(
                  JobDetailsRoute.name,
                  path: 'Job Details',
                  parent: HomeRouter.name,
                ),
              ],
            ),
            _i6.RouteConfig(
              AboutRoute.name,
              path: 'About',
              parent: NavigationRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.NavigationPage]
class NavigationRoute extends _i6.PageRouteInfo<NavigationRouteArgs> {
  NavigationRoute({
    _i7.Key? key,
    int? activeIndex,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          NavigationRoute.name,
          path: '/',
          args: NavigationRouteArgs(
            key: key,
            activeIndex: activeIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';
}

class NavigationRouteArgs {
  const NavigationRouteArgs({
    this.key,
    this.activeIndex,
  });

  final _i7.Key? key;

  final int? activeIndex;

  @override
  String toString() {
    return 'NavigationRouteArgs{key: $key, activeIndex: $activeIndex}';
  }
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HomeRouter extends _i6.PageRouteInfo<void> {
  const HomeRouter({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i3.AboutPage]
class AboutRoute extends _i6.PageRouteInfo<void> {
  const AboutRoute()
      : super(
          AboutRoute.name,
          path: 'About',
        );

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'Home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.JobDetailsPage]
class JobDetailsRoute extends _i6.PageRouteInfo<JobDetailsRouteArgs> {
  JobDetailsRoute({
    required _i8.Job job,
    _i7.Key? key,
  }) : super(
          JobDetailsRoute.name,
          path: 'Job Details',
          args: JobDetailsRouteArgs(
            job: job,
            key: key,
          ),
        );

  static const String name = 'JobDetailsRoute';
}

class JobDetailsRouteArgs {
  const JobDetailsRouteArgs({
    required this.job,
    this.key,
  });

  final _i8.Job job;

  final _i7.Key? key;

  @override
  String toString() {
    return 'JobDetailsRouteArgs{job: $job, key: $key}';
  }
}
