// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionRate _$$_SessionRateFromJson(Map<String, dynamic> json) =>
    _$_SessionRate(
      ticketReference: json['ticketReference'] as String,
      sessionId: json['sessionId'] as String,
      rate: (json['rate'] as num).toDouble(),
      review: json['review'] as String?,
    );

Map<String, dynamic> _$$_SessionRateToJson(_$_SessionRate instance) =>
    <String, dynamic>{
      'ticketReference': instance.ticketReference,
      'sessionId': instance.sessionId,
      'rate': instance.rate,
      'review': instance.review,
    };
