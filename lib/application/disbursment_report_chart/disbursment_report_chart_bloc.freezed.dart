// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'disbursment_report_chart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DisbursmentReportChartEventTearOff {
  const _$DisbursmentReportChartEventTearOff();

  _ChangeDate changeDate(DateTime time) {
    return _ChangeDate(
      time,
    );
  }
}

/// @nodoc
const $DisbursmentReportChartEvent = _$DisbursmentReportChartEventTearOff();

/// @nodoc
mixin _$DisbursmentReportChartEvent {
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
  $DisbursmentReportChartEventCopyWith<DisbursmentReportChartEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisbursmentReportChartEventCopyWith<$Res> {
  factory $DisbursmentReportChartEventCopyWith(
          DisbursmentReportChartEvent value,
          $Res Function(DisbursmentReportChartEvent) then) =
      _$DisbursmentReportChartEventCopyWithImpl<$Res>;
  $Res call({DateTime time});
}

/// @nodoc
class _$DisbursmentReportChartEventCopyWithImpl<$Res>
    implements $DisbursmentReportChartEventCopyWith<$Res> {
  _$DisbursmentReportChartEventCopyWithImpl(this._value, this._then);

  final DisbursmentReportChartEvent _value;
  // ignore: unused_field
  final $Res Function(DisbursmentReportChartEvent) _then;

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
    implements $DisbursmentReportChartEventCopyWith<$Res> {
  factory _$ChangeDateCopyWith(
          _ChangeDate value, $Res Function(_ChangeDate) then) =
      __$ChangeDateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime time});
}

/// @nodoc
class __$ChangeDateCopyWithImpl<$Res>
    extends _$DisbursmentReportChartEventCopyWithImpl<$Res>
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
    return 'DisbursmentReportChartEvent.changeDate(time: $time)';
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

abstract class _ChangeDate implements DisbursmentReportChartEvent {
  const factory _ChangeDate(DateTime time) = _$_ChangeDate;

  @override
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$ChangeDateCopyWith<_ChangeDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DisbursmentReportChartStateTearOff {
  const _$DisbursmentReportChartStateTearOff();

  _DisbursmentReportChartState call({required DateTime time}) {
    return _DisbursmentReportChartState(
      time: time,
    );
  }
}

/// @nodoc
const $DisbursmentReportChartState = _$DisbursmentReportChartStateTearOff();

/// @nodoc
mixin _$DisbursmentReportChartState {
  DateTime get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DisbursmentReportChartStateCopyWith<DisbursmentReportChartState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisbursmentReportChartStateCopyWith<$Res> {
  factory $DisbursmentReportChartStateCopyWith(
          DisbursmentReportChartState value,
          $Res Function(DisbursmentReportChartState) then) =
      _$DisbursmentReportChartStateCopyWithImpl<$Res>;
  $Res call({DateTime time});
}

/// @nodoc
class _$DisbursmentReportChartStateCopyWithImpl<$Res>
    implements $DisbursmentReportChartStateCopyWith<$Res> {
  _$DisbursmentReportChartStateCopyWithImpl(this._value, this._then);

  final DisbursmentReportChartState _value;
  // ignore: unused_field
  final $Res Function(DisbursmentReportChartState) _then;

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
abstract class _$DisbursmentReportChartStateCopyWith<$Res>
    implements $DisbursmentReportChartStateCopyWith<$Res> {
  factory _$DisbursmentReportChartStateCopyWith(
          _DisbursmentReportChartState value,
          $Res Function(_DisbursmentReportChartState) then) =
      __$DisbursmentReportChartStateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime time});
}

/// @nodoc
class __$DisbursmentReportChartStateCopyWithImpl<$Res>
    extends _$DisbursmentReportChartStateCopyWithImpl<$Res>
    implements _$DisbursmentReportChartStateCopyWith<$Res> {
  __$DisbursmentReportChartStateCopyWithImpl(
      _DisbursmentReportChartState _value,
      $Res Function(_DisbursmentReportChartState) _then)
      : super(_value, (v) => _then(v as _DisbursmentReportChartState));

  @override
  _DisbursmentReportChartState get _value =>
      super._value as _DisbursmentReportChartState;

  @override
  $Res call({
    Object? time = freezed,
  }) {
    return _then(_DisbursmentReportChartState(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_DisbursmentReportChartState implements _DisbursmentReportChartState {
  const _$_DisbursmentReportChartState({required this.time});

  @override
  final DateTime time;

  @override
  String toString() {
    return 'DisbursmentReportChartState(time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DisbursmentReportChartState &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$DisbursmentReportChartStateCopyWith<_DisbursmentReportChartState>
      get copyWith => __$DisbursmentReportChartStateCopyWithImpl<
          _DisbursmentReportChartState>(this, _$identity);
}

abstract class _DisbursmentReportChartState
    implements DisbursmentReportChartState {
  const factory _DisbursmentReportChartState({required DateTime time}) =
      _$_DisbursmentReportChartState;

  @override
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$DisbursmentReportChartStateCopyWith<_DisbursmentReportChartState>
      get copyWith => throw _privateConstructorUsedError;
}
