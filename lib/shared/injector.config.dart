// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:code_id_alice/alice.dart' as _i17;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../application/auth_bloc/authentication_bloc.dart' as _i18;
import '../application/disbursmenet_summary_report/disbursment_summary_report_bloc.dart'
    as _i11;
import '../application/disbursment_report_chart/disbursment_report_chart_bloc.dart'
    as _i10;
import '../application/login/login_cubit.dart' as _i13;
import '../application/necessity_dynamic_form/necessity_dynamic_form_bloc.dart'
    as _i14;
import '../application/user_necessity/user_necessity_bloc.dart' as _i16;
import '../infrastructure/auth/auth_repository.dart' as _i5;
import '../infrastructure/core/cache.dart' as _i6;
import '../presentation/app_widget.dart' as _i4;
import 'bloc_delegator.dart' as _i15;
import 'register_modules.dart' as _i19;
import 'router/app_router.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModules = _$RegisterModules();
  gh.lazySingleton<_i3.AppRouters>(() => registerModules.appRouter);
  gh.factory<_i4.AppWidget>(() => _i4.AppWidget(router: get<_i3.AppRouters>()));
  gh.lazySingleton<_i5.AuthenticationRepository>(() =>
      _i5.AuthenticationRepository(
          cache: get<_i6.CacheClient>(),
          firebaseAuth: get<_i7.FirebaseAuth>(),
          sharedPreferences: get<_i8.SharedPreferences>(),
          googleSignIn: get<_i9.GoogleSignIn>()));
  gh.lazySingleton<_i6.CacheClient>(() => _i6.CacheClient());
  gh.factory<_i10.DisbursmentReportChartBloc>(
      () => _i10.DisbursmentReportChartBloc());
  gh.factory<_i11.DisbursmentSummaryReportBloc>(
      () => _i11.DisbursmentSummaryReportBloc());
  gh.lazySingleton<_i7.FirebaseAuth>(() => registerModules.firebaseAuth);
  gh.lazySingleton<_i9.GoogleSignIn>(() => registerModules.googleSignIn);
  gh.lazySingleton<_i12.Logger>(() => registerModules.logger);
  gh.factory<_i13.LoginCubit>(() => _i13.LoginCubit(
      authenticationRepository: get<_i5.AuthenticationRepository>()));
  gh.factory<_i14.NecessityDynamicFormBloc>(
      () => _i14.NecessityDynamicFormBloc());
  await gh.lazySingletonAsync<_i8.SharedPreferences>(
      () => registerModules.sharedPreferences,
      preResolve: true);
  gh.factory<_i15.SimpleBlocObserver>(
      () => _i15.SimpleBlocObserver(get<_i12.Logger>()));
  gh.factory<String>(() => registerModules.baseUrl, instanceName: 'baseUrl');
  gh.factory<String>(() => registerModules.apiKey, instanceName: 'apiKey');
  gh.factory<_i16.UserNecessityBloc>(
      () => _i16.UserNecessityBloc(get<_i5.AuthenticationRepository>()));
  gh.lazySingleton<_i17.Alice>(
      () => registerModules.alice(get<_i3.AppRouters>()));
  gh.factory<_i18.AuthenticationBloc>(() => _i18.AuthenticationBloc(
      authenticationRepository: get<_i5.AuthenticationRepository>()));
  return get;
}

class _$RegisterModules extends _i19.RegisterModules {}
