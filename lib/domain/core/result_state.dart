
import 'package:freezed_annotation/freezed_annotation.dart';
part 'result_state.freezed.dart';
@freezed
class ResultState with _$ResultState{
  const factory ResultState.noConnection() = _NoConnection;
  const factory ResultState.serverError() = _ServerError;
  const factory ResultState.unknownError() = _UnknownError;
  const factory ResultState.loading() = _Loading;
  const factory ResultState.initial() = _Initial;
  const factory ResultState.success() = _Success;
  const factory ResultState.error(String? msg) = _Error;
}