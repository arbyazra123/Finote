import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/auth/auth_repository.dart';
import '../../infrastructure/user/models/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

enum AppStatus { authenticated, unauthenticated, loading }

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.id.isNotEmpty == true
              ? AuthenticationState.authenticated(
                  authenticationRepository.currentUser)
              : AuthenticationState.unauthenticated(),
        ) {
    _userSubscription = _authenticationRepository.user.listen(_onUserChanged);
    on<_AppUserChanged>(_mapUserChangedToState);
    on<_AppLogoutRequested>((e, emit) {
      unawaited(_authenticationRepository.logOut());
    });
  }

  void _mapUserChangedToState(
      _AppUserChanged event, Emitter<AuthenticationState> emit) async {
    if (event.user.id.isNotEmpty) {
      return emit(AuthenticationState.authenticated(event.user));
    }
    return emit(AuthenticationState.unauthenticated());
  }

  void _onUserChanged(User user) =>
      add(AuthenticationEvent.appUserChanged(user));

  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<User>? _userSubscription;

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
