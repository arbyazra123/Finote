part of 'user_necessity_bloc.dart';

@freezed
class UserNecessityState with _$UserNecessityState {
  const factory UserNecessityState({
    required UserNecessity userNecessity,
    required ResultState process,
    required bool isSalaryVisible,
  }) = _UserNecessityState;
  factory UserNecessityState.initial() => UserNecessityState(
      userNecessity: UserNecessity.empty(),
      process: ResultState.initial(),
      isSalaryVisible: false);
}
