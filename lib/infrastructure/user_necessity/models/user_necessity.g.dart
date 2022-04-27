// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_necessity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserNecessity _$$_UserNecessityFromJson(Map<String, dynamic> json) =>
    _$_UserNecessity(
      uid: json['uid'] as String,
      id: json['id'] as String,
      salary: (json['salary'] as num?)?.toDouble(),
      necessity: (json['necessity'] as List<dynamic>?)
          ?.map((e) => Necessity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserNecessityToJson(_$_UserNecessity instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'salary': instance.salary,
      'necessity': instance.necessity?.map((e) => e.toJson()).toList(),
    };

_$_Necessity _$$_NecessityFromJson(Map<String, dynamic> json) => _$_Necessity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      datetime: json['datetime'] as String?,
      description: json['description'] as String?,
      disbursementIntervalType: json['disbursementIntervalType'] as String?,
    );

Map<String, dynamic> _$$_NecessityToJson(_$_Necessity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'datetime': instance.datetime,
      'description': instance.description,
      'disbursementIntervalType': instance.disbursementIntervalType,
    };
