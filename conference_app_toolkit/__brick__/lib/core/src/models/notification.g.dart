// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      notification: json['notification'] as Map<String, dynamic>,
      data: json['data'] as Map<String, dynamic>,
      action:
          $enumDecodeNullable(_$NotificationActionEnumMap, json['action']) ??
              NotificationAction.unknown,
      screen:
          $enumDecodeNullable(_$NotificationScreenEnumMap, json['screen']) ??
              NotificationScreen.unknown,
      isForground: json['isForground'] as bool? ?? false,
      sentTime: sentTimeFromJson(json['sentTime'] as String),
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'notification': instance.notification,
      'data': instance.data,
      'action': _$NotificationActionEnumMap[instance.action]!,
      'screen': _$NotificationScreenEnumMap[instance.screen]!,
      'isForground': instance.isForground,
      'sentTime': instance.sentTime?.toIso8601String(),
    };

const _$NotificationActionEnumMap = {
  NotificationAction.navigate: 'navigate',
  NotificationAction.dialog: 'dialog',
  NotificationAction.silent: 'silent',
  NotificationAction.unknown: 'unknown',
};

const _$NotificationScreenEnumMap = {
  NotificationScreen.session: 'session',
  NotificationScreen.unknown: 'unknown',
};
