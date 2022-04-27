// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouters extends RootStackRouter {
  _$AppRouters([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginWrapperPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    ReportRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ReportPage());
    },
    AddNecessityRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AddNecessityPage());
    },
    ManipulateNecessityRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ManipulateNecessityPage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        RouteConfig(LoginWrapperRoute.name, path: '/login', children: [
          RouteConfig(LoginRoute.name, path: '', parent: LoginWrapperRoute.name)
        ]),
        RouteConfig(HomeRoute.name, path: '/landing'),
        RouteConfig(ReportRoute.name, path: '/report'),
        RouteConfig(AddNecessityRoute.name, path: '/add_necessity'),
        RouteConfig(ManipulateNecessityRoute.name,
            path: '/manipualte_necessity')
      ];
}

/// generated route for
/// [LoginWrapperPage]
class LoginWrapperRoute extends PageRouteInfo<void> {
  const LoginWrapperRoute({List<PageRouteInfo>? children})
      : super(LoginWrapperRoute.name,
            path: '/login', initialChildren: children);

  static const String name = 'LoginWrapperRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/landing');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ReportPage]
class ReportRoute extends PageRouteInfo<void> {
  const ReportRoute() : super(ReportRoute.name, path: '/report');

  static const String name = 'ReportRoute';
}

/// generated route for
/// [AddNecessityPage]
class AddNecessityRoute extends PageRouteInfo<void> {
  const AddNecessityRoute()
      : super(AddNecessityRoute.name, path: '/add_necessity');

  static const String name = 'AddNecessityRoute';
}

/// generated route for
/// [ManipulateNecessityPage]
class ManipulateNecessityRoute extends PageRouteInfo<void> {
  const ManipulateNecessityRoute()
      : super(ManipulateNecessityRoute.name, path: '/manipualte_necessity');

  static const String name = 'ManipulateNecessityRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '');

  static const String name = 'LoginRoute';
}
