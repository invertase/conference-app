import 'package:freezed_annotation/freezed_annotation.dart';

import 'sponsor_logo.dart';

part 'sponsor.freezed.dart';
part 'sponsor.g.dart';

@freezed
class Sponsor with _$Sponsor {
  @JsonSerializable(explicitToJson: true)
  const factory Sponsor({
    required String id,
    required String name,
    required int level,
    required SponsorLogo logo,
    String? tagline,
    String? about,
    String? contest,
    String? contestLink,
    @Default([]) List<dynamic> links,
  }) = _Sponsor;

  factory Sponsor.fromJson(Map<String, Object?> json) =>
      _$SponsorFromJson(json);
}
