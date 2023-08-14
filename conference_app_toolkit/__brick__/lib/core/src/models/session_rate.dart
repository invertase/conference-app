import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_rate.freezed.dart';
part 'session_rate.g.dart';

@freezed
class SessionRate with _$SessionRate {
  @JsonSerializable(explicitToJson: true)
  const factory SessionRate({
    required String ticketReference,
    required String sessionId,
    required double rate,
    String? review,
  }) = _SessionRate;

  factory SessionRate.fromJson(Map<String, Object?> json) =>
      _$SessionRateFromJson(json);
}
