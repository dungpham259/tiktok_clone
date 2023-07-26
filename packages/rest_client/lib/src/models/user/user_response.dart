// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rest_client/src/models/user/support.dart';
import 'package:rest_client/src/models/user/user.dart';
part 'user_response.freezed.dart';
part 'user_response.g.dart';

@Freezed(fromJson: true)
class UserResponse with _$UserResponse {
  const factory UserResponse({
    int? page,
    @JsonKey(name: 'per_page') int? perPage,
    int? total,
    @JsonKey(name: 'total_pages') int? totalPages,
    List<User>? data,
    Support? support,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
