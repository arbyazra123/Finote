// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'necessity_form_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NecessityFormListTearOff {
  const _$NecessityFormListTearOff();

  _NecessityFormList call(
      {required String id, required IList<NecessityForm> forms}) {
    return _NecessityFormList(
      id: id,
      forms: forms,
    );
  }
}

/// @nodoc
const $NecessityFormList = _$NecessityFormListTearOff();

/// @nodoc
mixin _$NecessityFormList {
  String get id => throw _privateConstructorUsedError;
  IList<NecessityForm> get forms => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NecessityFormListCopyWith<NecessityFormList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NecessityFormListCopyWith<$Res> {
  factory $NecessityFormListCopyWith(
          NecessityFormList value, $Res Function(NecessityFormList) then) =
      _$NecessityFormListCopyWithImpl<$Res>;
  $Res call({String id, IList<NecessityForm> forms});
}

/// @nodoc
class _$NecessityFormListCopyWithImpl<$Res>
    implements $NecessityFormListCopyWith<$Res> {
  _$NecessityFormListCopyWithImpl(this._value, this._then);

  final NecessityFormList _value;
  // ignore: unused_field
  final $Res Function(NecessityFormList) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? forms = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      forms: forms == freezed
          ? _value.forms
          : forms // ignore: cast_nullable_to_non_nullable
              as IList<NecessityForm>,
    ));
  }
}

/// @nodoc
abstract class _$NecessityFormListCopyWith<$Res>
    implements $NecessityFormListCopyWith<$Res> {
  factory _$NecessityFormListCopyWith(
          _NecessityFormList value, $Res Function(_NecessityFormList) then) =
      __$NecessityFormListCopyWithImpl<$Res>;
  @override
  $Res call({String id, IList<NecessityForm> forms});
}

/// @nodoc
class __$NecessityFormListCopyWithImpl<$Res>
    extends _$NecessityFormListCopyWithImpl<$Res>
    implements _$NecessityFormListCopyWith<$Res> {
  __$NecessityFormListCopyWithImpl(
      _NecessityFormList _value, $Res Function(_NecessityFormList) _then)
      : super(_value, (v) => _then(v as _NecessityFormList));

  @override
  _NecessityFormList get _value => super._value as _NecessityFormList;

  @override
  $Res call({
    Object? id = freezed,
    Object? forms = freezed,
  }) {
    return _then(_NecessityFormList(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      forms: forms == freezed
          ? _value.forms
          : forms // ignore: cast_nullable_to_non_nullable
              as IList<NecessityForm>,
    ));
  }
}

/// @nodoc

class _$_NecessityFormList implements _NecessityFormList {
  const _$_NecessityFormList({required this.id, required this.forms});

  @override
  final String id;
  @override
  final IList<NecessityForm> forms;

  @override
  String toString() {
    return 'NecessityFormList(id: $id, forms: $forms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NecessityFormList &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.forms, forms));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(forms));

  @JsonKey(ignore: true)
  @override
  _$NecessityFormListCopyWith<_NecessityFormList> get copyWith =>
      __$NecessityFormListCopyWithImpl<_NecessityFormList>(this, _$identity);
}

abstract class _NecessityFormList implements NecessityFormList {
  const factory _NecessityFormList(
      {required String id,
      required IList<NecessityForm> forms}) = _$_NecessityFormList;

  @override
  String get id;
  @override
  IList<NecessityForm> get forms;
  @override
  @JsonKey(ignore: true)
  _$NecessityFormListCopyWith<_NecessityFormList> get copyWith =>
      throw _privateConstructorUsedError;
}
