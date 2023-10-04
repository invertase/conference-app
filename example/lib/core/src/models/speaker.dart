import 'package:freezed_annotation/freezed_annotation.dart';

part 'speaker.freezed.dart';
part 'speaker.g.dart';

@freezed
class Speaker with _$Speaker {
  @JsonSerializable(explicitToJson: true)
  const factory Speaker({
    required String id,
    required String firstName,
    required String lastName,
    required String fullName,
    required List<int> sessions,
    String? profilePicture,
    String? bio,
    String? tagLine,
    bool? isTopSpeaker,
    List<dynamic>? links,
  }) = _Speaker;

  factory Speaker.fromJson(Map<String, Object?> json) =>
      _$SpeakerFromJson(json);
}
