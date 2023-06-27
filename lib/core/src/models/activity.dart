import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class Activity with _$Activity {
  const factory Activity({
    required String id,
    required String title,
    required String intro,
    required String content,
    required String url,
    String? banner,
  }) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json) =>
      _$ActivityFromJson(json);
}
