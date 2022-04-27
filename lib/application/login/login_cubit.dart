import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/auth/auth_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authenticationRepository})
      : super(LoginState.initial());

  final AuthenticationRepository authenticationRepository;
  Future<void> logInWithGoogle() async {
    emit(LoginState.loading());
    try {
      await authenticationRepository.logInWithGoogle();

      emit(LoginState.successLogin());
    } on Exception catch (e) {
      emit(LoginState.errorLogin(e.toString()));
    } on NoSuchMethodError catch (e) {
      emit(LoginState.errorLogin(e.toString()));
    }
  }
  Future<void> logInWithApple() async {
    emit(LoginState.loading());
    try {
      await authenticationRepository.logInWithApple();

      emit(LoginState.successLogin());
    } on Exception catch (e) {
      emit(LoginState.errorLogin(e.toString()));
    } on NoSuchMethodError catch (e) {
      emit(LoginState.errorLogin(e.toString()));
    }
  }

  Future<void> logInAnonymously() async {
    emit(LoginState.loading());
    try {
      await authenticationRepository.logInAnonymously();
      emit(LoginState.successLogin());
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(LoginState.errorLogin(e.toString()));
    } on NoSuchMethodError catch (e) {
      debugPrint(e.toString());
      emit(LoginState.errorLogin(e.toString()));
    }
  }
}
