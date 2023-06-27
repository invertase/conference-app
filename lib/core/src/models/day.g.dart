// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Day _$$_DayFromJson(Map<String, dynamic> json) => _$_Day(
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_DayToJson(_$_Day instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'name': instance.name,
    };
