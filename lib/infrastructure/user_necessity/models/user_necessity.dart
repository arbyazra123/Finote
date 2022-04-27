// To parse this JSON data, do
//
//     final userNecessity = userNecessityFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_necessity.freezed.dart';
part 'user_necessity.g.dart';

UserNecessity userNecessityFromJson(String str) =>
    UserNecessity.fromJson(json.decode(str));

String userNecessityToJson(UserNecessity data) => json.encode(data.toJson());

@freezed
class UserNecessity with _$UserNecessity {
  @JsonSerializable(explicitToJson: true)
  const factory UserNecessity({
    required String uid,
    required String id,
    double? salary,
    List<Necessity>? necessity,
  }) = _UserNecessity;
  factory UserNecessity.empty() =>
      _UserNecessity(uid: "", id: "", salary: 0, necessity: []);
  factory UserNecessity.fromJson(Map<String, dynamic> json) =>
      _$UserNecessityFromJson(json);
}

@freezed
class Necessity with _$Necessity {
  @JsonSerializable(explicitToJson: true)
  const factory Necessity({
    String? id,
    String? name,
    double? amount,
    String? datetime,
    String? description,
    String? disbursementIntervalType,
  }) = _Necessity;

  factory Necessity.fromJson(Map<String, dynamic> json) =>
      _$NecessityFromJson(json);
}
