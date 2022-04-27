// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_necessity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserNecessityEventTearOff {
  const _$UserNecessityEventTearOff();

  _Initialize initialize() {
    return const _Initialize();
  }

  _Get get() {
    return const _Get();
  }

  _DeleteById deleteById(String id) {
    return _DeleteById(
      id,
    );
  }

  _GetByDate getByDate(
      {required DateTime dateTime, required UserNecessity userNecessity}) {
    return _GetByDate(
      dateTime: dateTime,
      userNecessity: userNecessity,
    );
  }

  _ToggleSalaryVisbility toggleSalaryVisbility() {
    return const _ToggleSalaryVisbility();
  }

  _UpdateForm updateForm(
      {required NecessityFormList formList, required DateTime dateTime}) {
    return _UpdateForm(
      formList: formList,
      dateTime: dateTime,
    );
  }

  _UpdateSalary updateSalary(double salary) {
    return _UpdateSalary(
      salary,
    );
  }

  _Save save() {
    return const _Save();
  }
}

/// @nodoc
const $UserNecessityEvent = _$UserNecessityEventTearOff();

/// @nodoc
mixin _$UserNecessityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() get,
    required TResult Function(String id) deleteById,
    required TResult Function(DateTime dateTime, UserNecessity userNecessity)
        getByDate,
    required TResult Function() toggleSalaryVisbility,
    required TResult Function(NecessityFormList formList, DateTime dateTime)
        updateForm,
    required TResult Function(double salary) updateSalary,
    required TResult Function() save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Get value) get,
    required TResult Function(_DeleteById value) deleteById,
    required TResult Function(_GetByDate value) getByDate,
    required TResult Function(_ToggleSalaryVisbility value)
        toggleSalaryVisbility,
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_UpdateSalary value) updateSalary,
    required TResult Function(_Save value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNecessityEventCopyWith<$Res> {
  factory $UserNecessityEventCopyWith(
          UserNecessityEvent value, $Res Function(UserNecessityEvent) then) =
      _$UserNecessityEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserNecessityEventCopyWithImpl<$Res>
    implements $UserNecessityEventCopyWith<$Res> {
  _$UserNecessityEventCopyWithImpl(this._value, this._then);

  final UserNecessityEvent _value;
  // ignore: unused_field
  final $Res Function(UserNecessityEvent) _then;
}

/// @nodoc
abstract class _$InitializeCopyWith<$Res> {
  factory _$InitializeCopyWith(
          _Initialize value, $Res Function(_Initialize) then) =
      __$InitializeCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitializeCopyWithImpl<$Res>
    extends _$UserNecessityEventCopyWithImpl<$Res>
    implements _$InitializeCopyWith<$Res> {
  __$InitializeCopyWithImpl(
      _Initialize _value, $Res Function(_Initialize) _then)
      : super(_value, (v) => _then(v as _Initialize));

  @override
  _Initialize get _value => super._value as _Initialize;
}

/// @nodoc

class _$_Initialize implements _Initialize {
  const _$_Initialize();

  @override
  String toString() {
    return 'UserNecessityEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initialize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() get,
    required TResult Function(String id) deleteById,
    required TResult Function(DateTime dateTime, UserNecessity userNecessity)
        getByDate,
    required TResult Function() toggleSalaryVisbility,
    required TResult Function(NecessityFormList formList, DateTime dateTime)
        updateForm,
    required TResult Function(double salary) updateSalary,
    required TResult Function() save,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Get value) get,
    required TResult Function(_DeleteById value) deleteById,
    required TResult Function(_GetByDate value) getByDate,
    required TResult Function(_ToggleSalaryVisbility value)
        toggleSalaryVisbility,
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_UpdateSalary value) updateSalary,
    required TResult Function(_Save value) save,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements UserNecessityEvent {
  const factory _Initialize() = _$_Initialize;
}

/// @nodoc
abstract class _$GetCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) then) =
      __$GetCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetCopyWithImpl<$Res> extends _$UserNecessityEventCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(_Get _value, $Res Function(_Get) _then)
      : super(_value, (v) => _then(v as _Get));

  @override
  _Get get _value => super._value as _Get;
}

/// @nodoc

class _$_Get implements _Get {
  const _$_Get();

  @override
  String toString() {
    return 'UserNecessityEvent.get()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Get);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() get,
    required TResult Function(String id) deleteById,
    required TResult Function(DateTime dateTime, UserNecessity userNecessity)
        getByDate,
    required TResult Function() toggleSalaryVisbility,
    required TResult Function(NecessityFormList formList, DateTime dateTime)
        updateForm,
    required TResult Function(double salary) updateSalary,
    required TResult Function() save,
  }) {
    return get();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
  }) {
    return get?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Get value) get,
    required TResult Function(_DeleteById value) deleteById,
    required TResult Function(_GetByDate value) getByDate,
    required TResult Function(_ToggleSalaryVisbility value)
        toggleSalaryVisbility,
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_UpdateSalary value) updateSalary,
    required TResult Function(_Save value) save,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class _Get implements UserNecessityEvent {
  const factory _Get() = _$_Get;
}

/// @nodoc
abstract class _$DeleteByIdCopyWith<$Res> {
  factory _$DeleteByIdCopyWith(
          _DeleteById value, $Res Function(_DeleteById) then) =
      __$DeleteByIdCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$DeleteByIdCopyWithImpl<$Res>
    extends _$UserNecessityEventCopyWithImpl<$Res>
    implements _$DeleteByIdCopyWith<$Res> {
  __$DeleteByIdCopyWithImpl(
      _DeleteById _value, $Res Function(_DeleteById) _then)
      : super(_value, (v) => _then(v as _DeleteById));

  @override
  _DeleteById get _value => super._value as _DeleteById;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_DeleteById(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteById implements _DeleteById {
  const _$_DeleteById(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'UserNecessityEvent.deleteById(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteById &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$DeleteByIdCopyWith<_DeleteById> get copyWith =>
      __$DeleteByIdCopyWithImpl<_DeleteById>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() get,
    required TResult Function(String id) deleteById,
    required TResult Function(DateTime dateTime, UserNecessity userNecessity)
        getByDate,
    required TResult Function() toggleSalaryVisbility,
    required TResult Function(NecessityFormList formList, DateTime dateTime)
        updateForm,
    required TResult Function(double salary) updateSalary,
    required TResult Function() save,
  }) {
    return deleteById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
  }) {
    return deleteById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (deleteById != null) {
      return deleteById(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Get value) get,
    required TResult Function(_DeleteById value) deleteById,
    required TResult Function(_GetByDate value) getByDate,
    required TResult Function(_ToggleSalaryVisbility value)
        toggleSalaryVisbility,
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_UpdateSalary value) updateSalary,
    required TResult Function(_Save value) save,
  }) {
    return deleteById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
  }) {
    return deleteById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (deleteById != null) {
      return deleteById(this);
    }
    return orElse();
  }
}

abstract class _DeleteById implements UserNecessityEvent {
  const factory _DeleteById(String id) = _$_DeleteById;

  String get id;
  @JsonKey(ignore: true)
  _$DeleteByIdCopyWith<_DeleteById> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetByDateCopyWith<$Res> {
  factory _$GetByDateCopyWith(
          _GetByDate value, $Res Function(_GetByDate) then) =
      __$GetByDateCopyWithImpl<$Res>;
  $Res call({DateTime dateTime, UserNecessity userNecessity});

  $UserNecessityCopyWith<$Res> get userNecessity;
}

/// @nodoc
class __$GetByDateCopyWithImpl<$Res>
    extends _$UserNecessityEventCopyWithImpl<$Res>
    implements _$GetByDateCopyWith<$Res> {
  __$GetByDateCopyWithImpl(_GetByDate _value, $Res Function(_GetByDate) _then)
      : super(_value, (v) => _then(v as _GetByDate));

  @override
  _GetByDate get _value => super._value as _GetByDate;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? userNecessity = freezed,
  }) {
    return _then(_GetByDate(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userNecessity: userNecessity == freezed
          ? _value.userNecessity
          : userNecessity // ignore: cast_nullable_to_non_nullable
              as UserNecessity,
    ));
  }

  @override
  $UserNecessityCopyWith<$Res> get userNecessity {
    return $UserNecessityCopyWith<$Res>(_value.userNecessity, (value) {
      return _then(_value.copyWith(userNecessity: value));
    });
  }
}

/// @nodoc

class _$_GetByDate implements _GetByDate {
  const _$_GetByDate({required this.dateTime, required this.userNecessity});

  @override
  final DateTime dateTime;
  @override
  final UserNecessity userNecessity;

  @override
  String toString() {
    return 'UserNecessityEvent.getByDate(dateTime: $dateTime, userNecessity: $userNecessity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetByDate &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality()
                .equals(other.userNecessity, userNecessity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(userNecessity));

  @JsonKey(ignore: true)
  @override
  _$GetByDateCopyWith<_GetByDate> get copyWith =>
      __$GetByDateCopyWithImpl<_GetByDate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() get,
    required TResult Function(String id) deleteById,
    required TResult Function(DateTime dateTime, UserNecessity userNecessity)
        getByDate,
    required TResult Function() toggleSalaryVisbility,
    required TResult Function(NecessityFormList formList, DateTime dateTime)
        updateForm,
    required TResult Function(double salary) updateSalary,
    required TResult Function() save,
  }) {
    return getByDate(dateTime, userNecessity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
  }) {
    return getByDate?.call(dateTime, userNecessity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (getByDate != null) {
      return getByDate(dateTime, userNecessity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Get value) get,
    required TResult Function(_DeleteById value) deleteById,
    required TResult Function(_GetByDate value) getByDate,
    required TResult Function(_ToggleSalaryVisbility value)
        toggleSalaryVisbility,
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_UpdateSalary value) updateSalary,
    required TResult Function(_Save value) save,
  }) {
    return getByDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
  }) {
    return getByDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (getByDate != null) {
      return getByDate(this);
    }
    return orElse();
  }
}

abstract class _GetByDate implements UserNecessityEvent {
  const factory _GetByDate(
      {required DateTime dateTime,
      required UserNecessity userNecessity}) = _$_GetByDate;

  DateTime get dateTime;
  UserNecessity get userNecessity;
  @JsonKey(ignore: true)
  _$GetByDateCopyWith<_GetByDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ToggleSalaryVisbilityCopyWith<$Res> {
  factory _$ToggleSalaryVisbilityCopyWith(_ToggleSalaryVisbility value,
          $Res Function(_ToggleSalaryVisbility) then) =
      __$ToggleSalaryVisbilityCopyWithImpl<$Res>;
}

/// @nodoc
class __$ToggleSalaryVisbilityCopyWithImpl<$Res>
    extends _$UserNecessityEventCopyWithImpl<$Res>
    implements _$ToggleSalaryVisbilityCopyWith<$Res> {
  __$ToggleSalaryVisbilityCopyWithImpl(_ToggleSalaryVisbility _value,
      $Res Function(_ToggleSalaryVisbility) _then)
      : super(_value, (v) => _then(v as _ToggleSalaryVisbility));

  @override
  _ToggleSalaryVisbility get _value => super._value as _ToggleSalaryVisbility;
}

/// @nodoc

class _$_ToggleSalaryVisbility implements _ToggleSalaryVisbility {
  const _$_ToggleSalaryVisbility();

  @override
  String toString() {
    return 'UserNecessityEvent.toggleSalaryVisbility()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ToggleSalaryVisbility);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() get,
    required TResult Function(String id) deleteById,
    required TResult Function(DateTime dateTime, UserNecessity userNecessity)
        getByDate,
    required TResult Function() toggleSalaryVisbility,
    required TResult Function(NecessityFormList formList, DateTime dateTime)
        updateForm,
    required TResult Function(double salary) updateSalary,
    required TResult Function() save,
  }) {
    return toggleSalaryVisbility();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
  }) {
    return toggleSalaryVisbility?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (toggleSalaryVisbility != null) {
      return toggleSalaryVisbility();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Get value) get,
    required TResult Function(_DeleteById value) deleteById,
    required TResult Function(_GetByDate value) getByDate,
    required TResult Function(_ToggleSalaryVisbility value)
        toggleSalaryVisbility,
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_UpdateSalary value) updateSalary,
    required TResult Function(_Save value) save,
  }) {
    return toggleSalaryVisbility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
  }) {
    return toggleSalaryVisbility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (toggleSalaryVisbility != null) {
      return toggleSalaryVisbility(this);
    }
    return orElse();
  }
}

abstract class _ToggleSalaryVisbility implements UserNecessityEvent {
  const factory _ToggleSalaryVisbility() = _$_ToggleSalaryVisbility;
}

/// @nodoc
abstract class _$UpdateFormCopyWith<$Res> {
  factory _$UpdateFormCopyWith(
          _UpdateForm value, $Res Function(_UpdateForm) then) =
      __$UpdateFormCopyWithImpl<$Res>;
  $Res call({NecessityFormList formList, DateTime dateTime});

  $NecessityFormListCopyWith<$Res> get formList;
}

/// @nodoc
class __$UpdateFormCopyWithImpl<$Res>
    extends _$UserNecessityEventCopyWithImpl<$Res>
    implements _$UpdateFormCopyWith<$Res> {
  __$UpdateFormCopyWithImpl(
      _UpdateForm _value, $Res Function(_UpdateForm) _then)
      : super(_value, (v) => _then(v as _UpdateForm));

  @override
  _UpdateForm get _value => super._value as _UpdateForm;

  @override
  $Res call({
    Object? formList = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_UpdateForm(
      formList: formList == freezed
          ? _value.formList
          : formList // ignore: cast_nullable_to_non_nullable
              as NecessityFormList,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $NecessityFormListCopyWith<$Res> get formList {
    return $NecessityFormListCopyWith<$Res>(_value.formList, (value) {
      return _then(_value.copyWith(formList: value));
    });
  }
}

/// @nodoc

class _$_UpdateForm implements _UpdateForm {
  const _$_UpdateForm({required this.formList, required this.dateTime});

  @override
  final NecessityFormList formList;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'UserNecessityEvent.updateForm(formList: $formList, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateForm &&
            const DeepCollectionEquality().equals(other.formList, formList) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(formList),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$UpdateFormCopyWith<_UpdateForm> get copyWith =>
      __$UpdateFormCopyWithImpl<_UpdateForm>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() get,
    required TResult Function(String id) deleteById,
    required TResult Function(DateTime dateTime, UserNecessity userNecessity)
        getByDate,
    required TResult Function() toggleSalaryVisbility,
    required TResult Function(NecessityFormList formList, DateTime dateTime)
        updateForm,
    required TResult Function(double salary) updateSalary,
    required TResult Function() save,
  }) {
    return updateForm(formList, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
  }) {
    return updateForm?.call(formList, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (updateForm != null) {
      return updateForm(formList, dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Get value) get,
    required TResult Function(_DeleteById value) deleteById,
    required TResult Function(_GetByDate value) getByDate,
    required TResult Function(_ToggleSalaryVisbility value)
        toggleSalaryVisbility,
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_UpdateSalary value) updateSalary,
    required TResult Function(_Save value) save,
  }) {
    return updateForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
  }) {
    return updateForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (updateForm != null) {
      return updateForm(this);
    }
    return orElse();
  }
}

abstract class _UpdateForm implements UserNecessityEvent {
  const factory _UpdateForm(
      {required NecessityFormList formList,
      required DateTime dateTime}) = _$_UpdateForm;

  NecessityFormList get formList;
  DateTime get dateTime;
  @JsonKey(ignore: true)
  _$UpdateFormCopyWith<_UpdateForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateSalaryCopyWith<$Res> {
  factory _$UpdateSalaryCopyWith(
          _UpdateSalary value, $Res Function(_UpdateSalary) then) =
      __$UpdateSalaryCopyWithImpl<$Res>;
  $Res call({double salary});
}

/// @nodoc
class __$UpdateSalaryCopyWithImpl<$Res>
    extends _$UserNecessityEventCopyWithImpl<$Res>
    implements _$UpdateSalaryCopyWith<$Res> {
  __$UpdateSalaryCopyWithImpl(
      _UpdateSalary _value, $Res Function(_UpdateSalary) _then)
      : super(_value, (v) => _then(v as _UpdateSalary));

  @override
  _UpdateSalary get _value => super._value as _UpdateSalary;

  @override
  $Res call({
    Object? salary = freezed,
  }) {
    return _then(_UpdateSalary(
      salary == freezed
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_UpdateSalary implements _UpdateSalary {
  const _$_UpdateSalary(this.salary);

  @override
  final double salary;

  @override
  String toString() {
    return 'UserNecessityEvent.updateSalary(salary: $salary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateSalary &&
            const DeepCollectionEquality().equals(other.salary, salary));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(salary));

  @JsonKey(ignore: true)
  @override
  _$UpdateSalaryCopyWith<_UpdateSalary> get copyWith =>
      __$UpdateSalaryCopyWithImpl<_UpdateSalary>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() get,
    required TResult Function(String id) deleteById,
    required TResult Function(DateTime dateTime, UserNecessity userNecessity)
        getByDate,
    required TResult Function() toggleSalaryVisbility,
    required TResult Function(NecessityFormList formList, DateTime dateTime)
        updateForm,
    required TResult Function(double salary) updateSalary,
    required TResult Function() save,
  }) {
    return updateSalary(salary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
  }) {
    return updateSalary?.call(salary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (updateSalary != null) {
      return updateSalary(salary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Get value) get,
    required TResult Function(_DeleteById value) deleteById,
    required TResult Function(_GetByDate value) getByDate,
    required TResult Function(_ToggleSalaryVisbility value)
        toggleSalaryVisbility,
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_UpdateSalary value) updateSalary,
    required TResult Function(_Save value) save,
  }) {
    return updateSalary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
  }) {
    return updateSalary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (updateSalary != null) {
      return updateSalary(this);
    }
    return orElse();
  }
}

abstract class _UpdateSalary implements UserNecessityEvent {
  const factory _UpdateSalary(double salary) = _$_UpdateSalary;

  double get salary;
  @JsonKey(ignore: true)
  _$UpdateSalaryCopyWith<_UpdateSalary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveCopyWith<$Res> {
  factory _$SaveCopyWith(_Save value, $Res Function(_Save) then) =
      __$SaveCopyWithImpl<$Res>;
}

/// @nodoc
class __$SaveCopyWithImpl<$Res> extends _$UserNecessityEventCopyWithImpl<$Res>
    implements _$SaveCopyWith<$Res> {
  __$SaveCopyWithImpl(_Save _value, $Res Function(_Save) _then)
      : super(_value, (v) => _then(v as _Save));

  @override
  _Save get _value => super._value as _Save;
}

/// @nodoc

class _$_Save implements _Save {
  const _$_Save();

  @override
  String toString() {
    return 'UserNecessityEvent.save()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Save);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() get,
    required TResult Function(String id) deleteById,
    required TResult Function(DateTime dateTime, UserNecessity userNecessity)
        getByDate,
    required TResult Function() toggleSalaryVisbility,
    required TResult Function(NecessityFormList formList, DateTime dateTime)
        updateForm,
    required TResult Function(double salary) updateSalary,
    required TResult Function() save,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? get,
    TResult Function(String id)? deleteById,
    TResult Function(DateTime dateTime, UserNecessity userNecessity)? getByDate,
    TResult Function()? toggleSalaryVisbility,
    TResult Function(NecessityFormList formList, DateTime dateTime)? updateForm,
    TResult Function(double salary)? updateSalary,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Get value) get,
    required TResult Function(_DeleteById value) deleteById,
    required TResult Function(_GetByDate value) getByDate,
    required TResult Function(_ToggleSalaryVisbility value)
        toggleSalaryVisbility,
    required TResult Function(_UpdateForm value) updateForm,
    required TResult Function(_UpdateSalary value) updateSalary,
    required TResult Function(_Save value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Get value)? get,
    TResult Function(_DeleteById value)? deleteById,
    TResult Function(_GetByDate value)? getByDate,
    TResult Function(_ToggleSalaryVisbility value)? toggleSalaryVisbility,
    TResult Function(_UpdateForm value)? updateForm,
    TResult Function(_UpdateSalary value)? updateSalary,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _Save implements UserNecessityEvent {
  const factory _Save() = _$_Save;
}

/// @nodoc
class _$UserNecessityStateTearOff {
  const _$UserNecessityStateTearOff();

  _UserNecessityState call(
      {required UserNecessity userNecessity,
      required ResultState process,
      required bool isSalaryVisible}) {
    return _UserNecessityState(
      userNecessity: userNecessity,
      process: process,
      isSalaryVisible: isSalaryVisible,
    );
  }
}

/// @nodoc
const $UserNecessityState = _$UserNecessityStateTearOff();

/// @nodoc
mixin _$UserNecessityState {
  UserNecessity get userNecessity => throw _privateConstructorUsedError;
  ResultState get process => throw _privateConstructorUsedError;
  bool get isSalaryVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserNecessityStateCopyWith<UserNecessityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNecessityStateCopyWith<$Res> {
  factory $UserNecessityStateCopyWith(
          UserNecessityState value, $Res Function(UserNecessityState) then) =
      _$UserNecessityStateCopyWithImpl<$Res>;
  $Res call(
      {UserNecessity userNecessity, ResultState process, bool isSalaryVisible});

  $UserNecessityCopyWith<$Res> get userNecessity;
  $ResultStateCopyWith<$Res> get process;
}

/// @nodoc
class _$UserNecessityStateCopyWithImpl<$Res>
    implements $UserNecessityStateCopyWith<$Res> {
  _$UserNecessityStateCopyWithImpl(this._value, this._then);

  final UserNecessityState _value;
  // ignore: unused_field
  final $Res Function(UserNecessityState) _then;

  @override
  $Res call({
    Object? userNecessity = freezed,
    Object? process = freezed,
    Object? isSalaryVisible = freezed,
  }) {
    return _then(_value.copyWith(
      userNecessity: userNecessity == freezed
          ? _value.userNecessity
          : userNecessity // ignore: cast_nullable_to_non_nullable
              as UserNecessity,
      process: process == freezed
          ? _value.process
          : process // ignore: cast_nullable_to_non_nullable
              as ResultState,
      isSalaryVisible: isSalaryVisible == freezed
          ? _value.isSalaryVisible
          : isSalaryVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserNecessityCopyWith<$Res> get userNecessity {
    return $UserNecessityCopyWith<$Res>(_value.userNecessity, (value) {
      return _then(_value.copyWith(userNecessity: value));
    });
  }

  @override
  $ResultStateCopyWith<$Res> get process {
    return $ResultStateCopyWith<$Res>(_value.process, (value) {
      return _then(_value.copyWith(process: value));
    });
  }
}

/// @nodoc
abstract class _$UserNecessityStateCopyWith<$Res>
    implements $UserNecessityStateCopyWith<$Res> {
  factory _$UserNecessityStateCopyWith(
          _UserNecessityState value, $Res Function(_UserNecessityState) then) =
      __$UserNecessityStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserNecessity userNecessity, ResultState process, bool isSalaryVisible});

  @override
  $UserNecessityCopyWith<$Res> get userNecessity;
  @override
  $ResultStateCopyWith<$Res> get process;
}

/// @nodoc
class __$UserNecessityStateCopyWithImpl<$Res>
    extends _$UserNecessityStateCopyWithImpl<$Res>
    implements _$UserNecessityStateCopyWith<$Res> {
  __$UserNecessityStateCopyWithImpl(
      _UserNecessityState _value, $Res Function(_UserNecessityState) _then)
      : super(_value, (v) => _then(v as _UserNecessityState));

  @override
  _UserNecessityState get _value => super._value as _UserNecessityState;

  @override
  $Res call({
    Object? userNecessity = freezed,
    Object? process = freezed,
    Object? isSalaryVisible = freezed,
  }) {
    return _then(_UserNecessityState(
      userNecessity: userNecessity == freezed
          ? _value.userNecessity
          : userNecessity // ignore: cast_nullable_to_non_nullable
              as UserNecessity,
      process: process == freezed
          ? _value.process
          : process // ignore: cast_nullable_to_non_nullable
              as ResultState,
      isSalaryVisible: isSalaryVisible == freezed
          ? _value.isSalaryVisible
          : isSalaryVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UserNecessityState implements _UserNecessityState {
  const _$_UserNecessityState(
      {required this.userNecessity,
      required this.process,
      required this.isSalaryVisible});

  @override
  final UserNecessity userNecessity;
  @override
  final ResultState process;
  @override
  final bool isSalaryVisible;

  @override
  String toString() {
    return 'UserNecessityState(userNecessity: $userNecessity, process: $process, isSalaryVisible: $isSalaryVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserNecessityState &&
            const DeepCollectionEquality()
                .equals(other.userNecessity, userNecessity) &&
            const DeepCollectionEquality().equals(other.process, process) &&
            const DeepCollectionEquality()
                .equals(other.isSalaryVisible, isSalaryVisible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userNecessity),
      const DeepCollectionEquality().hash(process),
      const DeepCollectionEquality().hash(isSalaryVisible));

  @JsonKey(ignore: true)
  @override
  _$UserNecessityStateCopyWith<_UserNecessityState> get copyWith =>
      __$UserNecessityStateCopyWithImpl<_UserNecessityState>(this, _$identity);
}

abstract class _UserNecessityState implements UserNecessityState {
  const factory _UserNecessityState(
      {required UserNecessity userNecessity,
      required ResultState process,
      required bool isSalaryVisible}) = _$_UserNecessityState;

  @override
  UserNecessity get userNecessity;
  @override
  ResultState get process;
  @override
  bool get isSalaryVisible;
  @override
  @JsonKey(ignore: true)
  _$UserNecessityStateCopyWith<_UserNecessityState> get copyWith =>
      throw _privateConstructorUsedError;
}
