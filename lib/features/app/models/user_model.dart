import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? uid,
    String? username,
    String? password,
    String? email,
  }) = _UserModel;

  factory UserModel.initial() => const UserModel(
        uid: '',
        username: '',
        email: '',
      );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
