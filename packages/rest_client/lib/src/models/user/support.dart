import 'package:freezed_annotation/freezed_annotation.dart';
part 'support.freezed.dart';
part 'support.g.dart';

@Freezed(fromJson: true)
class Support with _$Support {
  const factory Support({
    String? url,
    String? text,
  }) = _Support;

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);
}
