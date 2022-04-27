// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disbursment_summary_report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DisbursmentSummaryReportEventTearOff {
  const _$DisbursmentSummaryReportEventTearOff();

  _ChangeDate changeDate(DateTime time) {
    return _ChangeDate(
      time,
    );
  }
}

/// @nodoc
const $DisbursmentSummaryReportEvent = _$DisbursmentSummaryReportEventTearOff();

/// @nodoc
mixin _$DisbursmentSummaryReportEvent {
  DateTime get time => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime time) changeDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime time)? changeDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime time)? changeDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDate value) changeDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeDate value)? changeDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDate value)? changeDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DisbursmentSummaryReportEventCopyWith<DisbursmentSummaryReportEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisbursmentSummaryReportEventCopyWith<$Res> {
  factory $DisbursmentSummaryReportEventCopyWith(
          DisbursmentSummaryReportEvent value,
          $Res Function(DisbursmentSummaryReportEvent) then) =
      _$DisbursmentSummaryReportEventCopyWithImpl<$Res>;
  $Res call({DateTime time});
}

/// @nodoc
class _$DisbursmentSummaryReportEventCopyWithImpl<$Res>
    implements $DisbursmentSummaryReportEventCopyWith<$Res> {
  _$DisbursmentSummaryReportEventCopyWithImpl(this._value, this._then);

  final DisbursmentSummaryReportEvent _value;
  // ignore: unused_field
  final $Res Function(DisbursmentSummaryReportEvent) _then;

  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ChangeDateCopyWith<$Res>
    implements $DisbursmentSummaryReportEventCopyWith<$Res> {
  factory _$ChangeDateCopyWith(
          _ChangeDate value, $Res Function(_ChangeDate) then) =
      __$ChangeDateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime time});
}

/// @nodoc
class __$ChangeDateCopyWithImpl<$Res>
    extends _$DisbursmentSummaryReportEventCopyWithImpl<$Res>
    implements _$ChangeDateCopyWith<$Res> {
  __$ChangeDateCopyWithImpl(
      _ChangeDate _value, $Res Function(_ChangeDate) _then)
      : super(_value, (v) => _then(v as _ChangeDate));

  @override
  _ChangeDate get _value => super._value as _ChangeDate;

  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_ChangeDate(
      time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ChangeDate implements _ChangeDate {
  const _$_ChangeDate(this.time);

  @override
  final DateTime time;

  @override
  String toString() {
    return 'DisbursmentSummaryReportEvent.changeDate(time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeDate &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$ChangeDateCopyWith<_ChangeDate> get copyWith =>
      __$ChangeDateCopyWithImpl<_ChangeDate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime time) changeDate,
  }) {
    return changeDate(time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime time)? changeDate,
  }) {
    return changeDate?.call(time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime time)? changeDate,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeDate value) changeDate,
  }) {
    return changeDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangeDate value)? changeDate,
  }) {
    return changeDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeDate value)? changeDate,
    required TResult orElse(),
  }) {
    if (changeDate != null) {
      return changeDate(this);
    }
    return orElse();
  }
}

abstract class _ChangeDate implements DisbursmentSummaryReportEvent {
  const factory _ChangeDate(DateTime time) = _$_ChangeDate;

  @override
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$ChangeDateCopyWith<_ChangeDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DisbursmentSummaryReportStateTearOff {
  const _$DisbursmentSummaryReportStateTearOff();

  _DisbursmentSummaryReportState call({required DateTime time}) {
    return _DisbursmentSummaryReportState(
      time: time,
    );
  }
}

/// @nodoc
const $DisbursmentSummaryReportState = _$DisbursmentSummaryReportStateTearOff();

/// @nodoc
mixin _$DisbursmentSummaryReportState {
  DateTime get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DisbursmentSummaryReportStateCopyWith<DisbursmentSummaryReportState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisbursmentSummaryReportStateCopyWith<$Res> {
  factory $DisbursmentSummaryReportStateCopyWith(
          DisbursmentSummaryReportState value,
          $Res Function(DisbursmentSummaryReportState) then) =
      _$DisbursmentSummaryReportStateCopyWithImpl<$Res>;
  $Res call({DateTime time});
}

/// @nodoc
class _$DisbursmentSummaryReportStateCopyWithImpl<$Res>
    implements $DisbursmentSummaryReportStateCopyWith<$Res> {
  _$DisbursmentSummaryReportStateCopyWithImpl(this._value, this._then);

  final DisbursmentSummaryReportState _value;
  // ignore: unused_field
  final $Res Function(DisbursmentSummaryReportState) _then;

  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$DisbursmentSummaryReportStateCopyWith<$Res>
    implements $DisbursmentSummaryReportStateCopyWith<$Res> {
  factory _$DisbursmentSummaryReportStateCopyWith(
          _DisbursmentSummaryReportState value,
          $Res Function(_DisbursmentSummaryReportState) then) =
      __$DisbursmentSummaryReportStateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime time});
}

/// @nodoc
class __$DisbursmentSummaryReportStateCopyWithImpl<$Res>
    extends _$DisbursmentSummaryReportStateCopyWithImpl<$Res>
    implements _$DisbursmentSummaryReportStateCopyWith<$Res> {
  __$DisbursmentSummaryReportStateCopyWithImpl(
      _DisbursmentSummaryReportState _value,
      $Res Function(_DisbursmentSummaryReportState) _then)
      : super(_value, (v) => _then(v as _DisbursmentSummaryReportState));

  @override
  _DisbursmentSummaryReportState get _value =>
      super._value as _DisbursmentSummaryReportState;

  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_DisbursmentSummaryReportState(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_DisbursmentSummaryReportState
    implements _DisbursmentSummaryReportState {
  const _$_DisbursmentSummaryReportState({required this.time});

  @override
  final DateTime time;

  @override
  String toString() {
    return 'DisbursmentSummaryReportState(time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DisbursmentSummaryReportState &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$DisbursmentSummaryReportStateCopyWith<_DisbursmentSummaryReportState>
      get copyWith => __$DisbursmentSummaryReportStateCopyWithImpl<
          _DisbursmentSummaryReportState>(this, _$identity);
}

abstract class _DisbursmentSummaryReportState
    implements DisbursmentSummaryReportState {
  const factory _DisbursmentSummaryReportState({required DateTime time}) =
      _$_DisbursmentSummaryReportState;

  @override
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$DisbursmentSummaryReportStateCopyWith<_DisbursmentSummaryReportState>
      get copyWith => throw _privateConstructorUsedError;
}
