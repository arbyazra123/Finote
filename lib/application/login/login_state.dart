part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.successLogin() = _SuccessLogin;
  const factory LoginState.errorLogin(String? error) = _ErrorLogin;
}
