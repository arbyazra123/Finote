import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    String? email,
    String? name,
    String? photo,
  }) = _User;

  factory User.empty() => User(
        id: '',
        email: '',
        name: '',
        photo: '',
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
