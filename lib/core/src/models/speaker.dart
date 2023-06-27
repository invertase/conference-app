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
    required String bio,
    required String tagLine,
    required String profilePicture,
    required bool isTopSpeaker,
    required List<dynamic> links,
    required List<int> sessions,
  }) = _Speaker;

  factory Speaker.fromJson(Map<String, Object?> json) =>
      _$SpeakerFromJson(json);
}
