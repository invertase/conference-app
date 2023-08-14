import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

enum SessionStatus {
  @JsonValue('upcoming')
  upcoming(Colors.green),
  @JsonValue('live')
  live(Colors.yellow),
  @JsonValue('gone')
  gone(Colors.red);

  const SessionStatus(this.color);
  final Color color;
}

DateTime convertTimestamnpToDateTime(Timestamp timestamp) {
  return timestamp.toDate();
}

@freezed
class Session with _$Session {
  @JsonSerializable(explicitToJson: true)
  const factory Session({
    required String id,
    required String title,
    required String? description,
    required int roomId,
    @JsonKey(defaultValue: SessionStatus.upcoming)
    required SessionStatus status,
    @JsonKey(fromJson: convertTimestamnpToDateTime) required DateTime startsAt,
    @JsonKey(fromJson: convertTimestamnpToDateTime) required DateTime endsAt,
    @JsonKey(defaultValue: false) required bool isServiceSession,
    @JsonKey(defaultValue: false) required bool isPlenumSession,
    @JsonKey(defaultValue: []) required List speakers,
    @JsonKey(defaultValue: []) required List categoryItems,
    @JsonKey() String? liveUrl,
    @JsonKey() String? recordingUrl,
  }) = _Session;

  factory Session.fromJson(Map<String, Object?> json) =>
      _$SessionFromJson(json);
}
