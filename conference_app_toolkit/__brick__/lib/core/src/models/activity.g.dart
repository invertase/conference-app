// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Activity _$$_ActivityFromJson(Map<String, dynamic> json) => _$_Activity(
      id: json['id'] as String,
      title: json['title'] as String,
      intro: json['intro'] as String,
      content: json['content'] as String,
      url: json['url'] as String,
      banner: json['banner'] as String?,
    );

Map<String, dynamic> _$$_ActivityToJson(_$_Activity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'intro': instance.intro,
      'content': instance.content,
      'url': instance.url,
      'banner': instance.banner,
    };
