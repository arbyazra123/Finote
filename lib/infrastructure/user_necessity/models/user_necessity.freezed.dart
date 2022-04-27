// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_necessity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserNecessity _$UserNecessityFromJson(Map<String, dynamic> json) {
  return _UserNecessity.fromJson(json);
}

/// @nodoc
class _$UserNecessityTearOff {
  const _$UserNecessityTearOff();

  _UserNecessity call(
      {required String uid,
      required String id,
      double? salary,
      List<Necessity>? necessity}) {
    return _UserNecessity(
      uid: uid,
      id: id,
      salary: salary,
      necessity: necessity,
    );
  }

  UserNecessity fromJson(Map<String, Object?> json) {
    return UserNecessity.fromJson(json);
  }
}

/// @nodoc
const $UserNecessity = _$UserNecessityTearOff();

/// @nodoc
mixin _$UserNecessity {
  String get uid => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  double? get salary => throw _privateConstructorUsedError;
  List<Necessity>? get necessity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserNecessityCopyWith<UserNecessity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNecessityCopyWith<$Res> {
  factory $UserNecessityCopyWith(
          UserNecessity value, $Res Function(UserNecessity) then) =
      _$UserNecessityCopyWithImpl<$Res>;
  $Res call(
      {String uid, String id, double? salary, List<Necessity>? necessity});
}

/// @nodoc
class _$UserNecessityCopyWithImpl<$Res>
    implements $UserNecessityCopyWith<$Res> {
  _$UserNecessityCopyWithImpl(this._value, this._then);

  final UserNecessity _value;
  // ignore: unused_field
  final $Res Function(UserNecessity) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? id = freezed,
    Object? salary = freezed,
    Object? necessity = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      salary: salary == freezed
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double?,
      necessity: necessity == freezed
          ? _value.necessity
          : necessity // ignore: cast_nullable_to_non_nullable
              as List<Necessity>?,
    ));
  }
}

/// @nodoc
abstract class _$UserNecessityCopyWith<$Res>
    implements $UserNecessityCopyWith<$Res> {
  factory _$UserNecessityCopyWith(
          _UserNecessity value, $Res Function(_UserNecessity) then) =
      __$UserNecessityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid, String id, double? salary, List<Necessity>? necessity});
}

/// @nodoc
class __$UserNecessityCopyWithImpl<$Res>
    extends _$UserNecessityCopyWithImpl<$Res>
    implements _$UserNecessityCopyWith<$Res> {
  __$UserNecessityCopyWithImpl(
      _UserNecessity _value, $Res Function(_UserNecessity) _then)
      : super(_value, (v) => _then(v as _UserNecessity));

  @override
  _UserNecessity get _value => super._value as _UserNecessity;

  @override
  $Res call({
    Object? uid = freezed,
    Object? id = freezed,
    Object? salary = freezed,
    Object? necessity = freezed,
  }) {
    return _then(_UserNecessity(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      salary: salary == freezed
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double?,
      necessity: necessity == freezed
          ? _value.necessity
          : necessity // ignore: cast_nullable_to_non_nullable
              as List<Necessity>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserNecessity implements _UserNecessity {
  const _$_UserNecessity(
      {required this.uid, required this.id, this.salary, this.necessity});

  factory _$_UserNecessity.fromJson(Map<String, dynamic> json) =>
      _$$_UserNecessityFromJson(json);

  @override
  final String uid;
  @override
  final String id;
  @override
  final double? salary;
  @override
  final List<Necessity>? necessity;

  @override
  String toString() {
    return 'UserNecessity(uid: $uid, id: $id, salary: $salary, necessity: $necessity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserNecessity &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.salary, salary) &&
            const DeepCollectionEquality().equals(other.necessity, necessity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(salary),
      const DeepCollectionEquality().hash(necessity));

  @JsonKey(ignore: true)
  @override
  _$UserNecessityCopyWith<_UserNecessity> get copyWith =>
      __$UserNecessityCopyWithImpl<_UserNecessity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserNecessityToJson(this);
  }
}

abstract class _UserNecessity implements UserNecessity {
  const factory _UserNecessity(
      {required String uid,
      required String id,
      double? salary,
      List<Necessity>? necessity}) = _$_UserNecessity;

  factory _UserNecessity.fromJson(Map<String, dynamic> json) =
      _$_UserNecessity.fromJson;

  @override
  String get uid;
  @override
  String get id;
  @override
  double? get salary;
  @override
  List<Necessity>? get necessity;
  @override
  @JsonKey(ignore: true)
  _$UserNecessityCopyWith<_UserNecessity> get copyWith =>
      throw _privateConstructorUsedError;
}

Necessity _$NecessityFromJson(Map<String, dynamic> json) {
  return _Necessity.fromJson(json);
}

/// @nodoc
class _$NecessityTearOff {
  const _$NecessityTearOff();

  _Necessity call(
      {String? id,
      String? name,
      double? amount,
      String? datetime,
      String? description,
      String? disbursementIntervalType}) {
    return _Necessity(
      id: id,
      name: name,
      amount: amount,
      datetime: datetime,
      description: description,
      disbursementIntervalType: disbursementIntervalType,
    );
  }

  Necessity fromJson(Map<String, Object?> json) {
    return Necessity.fromJson(json);
  }
}

/// @nodoc
const $Necessity = _$NecessityTearOff();

/// @nodoc
mixin _$Necessity {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get datetime => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get disbursementIntervalType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NecessityCopyWith<Necessity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NecessityCopyWith<$Res> {
  factory $NecessityCopyWith(Necessity value, $Res Function(Necessity) then) =
      _$NecessityCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? name,
      double? amount,
      String? datetime,
      String? description,
      String? disbursementIntervalType});
}

/// @nodoc
class _$NecessityCopyWithImpl<$Res> implements $NecessityCopyWith<$Res> {
  _$NecessityCopyWithImpl(this._value, this._then);

  final Necessity _value;
  // ignore: unused_field
  final $Res Function(Necessity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? datetime = freezed,
    Object? description = freezed,
    Object? disbursementIntervalType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      disbursementIntervalType: disbursementIntervalType == freezed
          ? _value.disbursementIntervalType
          : disbursementIntervalType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NecessityCopyWith<$Res> implements $NecessityCopyWith<$Res> {
  factory _$NecessityCopyWith(
          _Necessity value, $Res Function(_Necessity) then) =
      __$NecessityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      double? amount,
      String? datetime,
      String? description,
      String? disbursementIntervalType});
}

/// @nodoc
class __$NecessityCopyWithImpl<$Res> extends _$NecessityCopyWithImpl<$Res>
    implements _$NecessityCopyWith<$Res> {
  __$NecessityCopyWithImpl(_Necessity _value, $Res Function(_Necessity) _then)
      : super(_value, (v) => _then(v as _Necessity));

  @override
  _Necessity get _value => super._value as _Necessity;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? datetime = freezed,
    Object? description = freezed,
    Object? disbursementIntervalType = freezed,
  }) {
    return _then(_Necessity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      disbursementIntervalType: disbursementIntervalType == freezed
          ? _value.disbursementIntervalType
          : disbursementIntervalType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Necessity implements _Necessity {
  const _$_Necessity(
      {this.id,
      this.name,
      this.amount,
      this.datetime,
      this.description,
      this.disbursementIntervalType});

  factory _$_Necessity.fromJson(Map<String, dynamic> json) =>
      _$$_NecessityFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final double? amount;
  @override
  final String? datetime;
  @override
  final String? description;
  @override
  final String? disbursementIntervalType;

  @override
  String toString() {
    return 'Necessity(id: $id, name: $name, amount: $amount, datetime: $datetime, description: $description, disbursementIntervalType: $disbursementIntervalType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Necessity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.datetime, datetime) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(
                other.disbursementIntervalType, disbursementIntervalType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(datetime),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(disbursementIntervalType));

  @JsonKey(ignore: true)
  @override
  _$NecessityCopyWith<_Necessity> get copyWith =>
      __$NecessityCopyWithImpl<_Necessity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NecessityToJson(this);
  }
}

abstract class _Necessity implements Necessity {
  const factory _Necessity(
      {String? id,
      String? name,
      double? amount,
      String? datetime,
      String? description,
      String? disbursementIntervalType}) = _$_Necessity;

  factory _Necessity.fromJson(Map<String, dynamic> json) =
      _$_Necessity.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  double? get amount;
  @override
  String? get datetime;
  @override
  String? get description;
  @override
  String? get disbursementIntervalType;
  @override
  @JsonKey(ignore: true)
  _$NecessityCopyWith<_Necessity> get copyWith =>
      throw _privateConstructorUsedError;
}
