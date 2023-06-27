// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Speaker _$$_SpeakerFromJson(Map<String, dynamic> json) => _$_Speaker(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      fullName: json['fullName'] as String,
      bio: json['bio'] as String,
      tagLine: json['tagLine'] as String,
      profilePicture: json['profilePicture'] as String,
      isTopSpeaker: json['isTopSpeaker'] as bool,
      links: json['links'] as List<dynamic>,
      sessions:
          (json['sessions'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_SpeakerToJson(_$_Speaker instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'bio': instance.bio,
      'tagLine': instance.tagLine,
      'profilePicture': instance.profilePicture,
      'isTopSpeaker': instance.isTopSpeaker,
      'links': instance.links,
      'sessions': instance.sessions,
    };
