part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent() = _AuthenticationEvent;
  const factory AuthenticationEvent.appUserChanged(User user) = _AppUserChanged;
  const factory AuthenticationEvent.logoutRequested() = _AppLogoutRequested;
}

