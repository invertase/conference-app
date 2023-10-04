// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      roomId: json['roomId'] as int,
      status: $enumDecodeNullable(_$SessionStatusEnumMap, json['status']) ??
          SessionStatus.upcoming,
      startsAt: convertTimestamnpToDateTime(json['startsAt'] as Timestamp),
      endsAt: convertTimestamnpToDateTime(json['endsAt'] as Timestamp),
      isServiceSession: json['isServiceSession'] as bool? ?? false,
      isPlenumSession: json['isPlenumSession'] as bool? ?? false,
      speakers: json['speakers'] as List<dynamic>? ?? [],
      categoryItems: json['categoryItems'] as List<dynamic>? ?? [],
      liveUrl: json['liveUrl'] as String?,
      recordingUrl: json['recordingUrl'] as String?,
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'roomId': instance.roomId,
      'status': _$SessionStatusEnumMap[instance.status]!,
      'startsAt': instance.startsAt.toIso8601String(),
      'endsAt': instance.endsAt.toIso8601String(),
      'isServiceSession': instance.isServiceSession,
      'isPlenumSession': instance.isPlenumSession,
      'speakers': instance.speakers,
      'categoryItems': instance.categoryItems,
      'liveUrl': instance.liveUrl,
      'recordingUrl': instance.recordingUrl,
    };

const _$SessionStatusEnumMap = {
  SessionStatus.upcoming: 'upcoming',
  SessionStatus.live: 'live',
  SessionStatus.gone: 'gone',
};
