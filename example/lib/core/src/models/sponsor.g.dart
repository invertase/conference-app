// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sponsor _$$_SponsorFromJson(Map<String, dynamic> json) => _$_Sponsor(
      id: json['id'] as String,
      name: json['name'] as String,
      level: json['level'] as int,
      logo: SponsorLogo.fromJson(json['logo'] as Map<String, dynamic>),
      tagline: json['tagline'] as String?,
      about: json['about'] as String?,
      contest: json['contest'] as String?,
      contestLink: json['contestLink'] as String?,
      links: json['links'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$_SponsorToJson(_$_Sponsor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
      'logo': instance.logo.toJson(),
      'tagline': instance.tagline,
      'about': instance.about,
      'contest': instance.contest,
      'contestLink': instance.contestLink,
      'links': instance.links,
    };
