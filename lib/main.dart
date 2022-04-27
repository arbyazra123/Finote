import 'package:code_id_storage/code_id_storage.dart';
import 'package:finote/shared/handlers/fcm_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'application/auth_bloc/authentication_bloc.dart';
import 'application/disbursmenet_summary_report/disbursment_summary_report_bloc.dart';
import 'application/disbursment_report_chart/disbursment_report_chart_bloc.dart';
import 'application/user_necessity/user_necessity_bloc.dart';
import 'presentation/app_widget.dart';
import 'shared/bloc_delegator.dart';
import 'shared/handlers/notification_handler.dart';
import 'shared/injector.dart';

void main() async {
  Intl.defaultLocale = "id_ID";
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await initializeDateFormatting("id_ID", null);
  await Storage.init();
  await configureInjection(Environment.dev);
  // await initNotification();
  // await initFCM();
  BlocOverrides.runZoned(
    () => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AuthenticationBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<UserNecessityBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<DisbursmentSummaryReportBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<DisbursmentReportChartBloc>(),
          ),
        ],
        child: getIt<AppWidget>(),
      ),
    ),
    blocObserver: getIt<SimpleBlocObserver>(),
  );
}
