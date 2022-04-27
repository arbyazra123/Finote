import 'package:auto_route/auto_route.dart';
import 'package:finote/presentation/add_necessity/add_necessity_page.dart';
import 'package:finote/presentation/home/home_page.dart';
import 'package:finote/presentation/manipulate_necessity/manipulate_necessity_page.dart';
import 'package:finote/presentation/report/report_page.dart';
import 'package:finote/shared/router/route.dart';
import 'package:flutter/material.dart';

import '../../presentation/login/login_wrapper_page.dart';
import '../../presentation/login/widgets/screens/login_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: Routes.login,
      page: LoginWrapperPage,
      initial: true,
      children: [
        AutoRoute(path: '', page: LoginPage),
      ],
    ),
    AutoRoute(
      page: HomePage,
      path: Routes.landing,
    ),
    AutoRoute(
      page: ReportPage,
      path: Routes.report,
    ),
    AutoRoute(
      page: AddNecessityPage,
      path: Routes.add_necessity,
    ),
    AutoRoute(
      page: ManipulateNecessityPage,
      path: Routes.manipulate_necessity,
    ),
  ],
)
class AppRouters extends _$AppRouters {}
