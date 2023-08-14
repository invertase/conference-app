import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsor_logo.freezed.dart';
part 'sponsor_logo.g.dart';

@freezed
class SponsorLogo with _$SponsorLogo {
  const factory SponsorLogo({
    required String normal,
    String? dark,
  }) = _SponsorLogo;

  factory SponsorLogo.fromJson(Map<String, Object?> json) =>
      _$SponsorLogoFromJson(json);

  @override
  String toString() {
    return {'normal': normal, 'dark': dark}.toString();
  }
}
