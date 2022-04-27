import 'package:finote/shared/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import '../application/auth_bloc/authentication_bloc.dart';
import '../application/user_necessity/user_necessity_bloc.dart';
import '../shared/injector.dart';
import '../shared/router/app_router.dart';

@injectable
class AppWidget extends StatelessWidget {
  final AppRouters router;
  const AppWidget({required this.router});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.when(
          initial: () => null,
          authenticated: (user) {
            router.replace((HomeRoute()));
            getIt<UserNecessityBloc>().add(UserNecessityEvent.initialize());
          },
          unauthenticated: () => router.replace(LoginWrapperRoute()),
        );
      },
      child: MaterialApp.router(
        theme: ThemeData(
          buttonColor: AppColor.primary,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                AppColor.primary,
              ), //button color
              foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white,
              ), //text (and icon)
            ),
          ),
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: AppColor.primary),
          buttonTheme: ButtonThemeData(
            buttonColor: AppColor.primary,
          ),
          primaryColor: AppColor.primary,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routeInformationParser: router.defaultRouteParser(),
        routerDelegate: router.delegate(),
      ),
    );
  }
}
