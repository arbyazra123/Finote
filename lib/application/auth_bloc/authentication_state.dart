part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState.initial() = _Initial;
  factory AuthenticationState.unauthenticated() = _Unauthenticated;
  factory AuthenticationState.authenticated(User user) = _Authenticated;
}
