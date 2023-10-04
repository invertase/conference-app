import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

enum NotificationScreen {
  @JsonValue('session')
  session,
  @JsonValue('unknown')
  unknown,
}

enum NotificationAction {
  @JsonValue('navigate')
  navigate,
  @JsonValue('dialog')
  dialog,
  @JsonValue('silent')
  silent,
  @JsonValue('unknown')
  unknown,
}

DateTime? sentTimeFromJson(String sentTime) => DateTime.parse(sentTime);

@freezed
class Notification with _$Notification {
  @JsonSerializable(explicitToJson: true)
  const factory Notification({
    required Map<String, dynamic> notification,
    required Map<String, dynamic> data,
    @Default(NotificationAction.unknown) NotificationAction action,
    @Default(NotificationScreen.unknown) NotificationScreen screen,
    @Default(false) bool isForground,
    @JsonKey(fromJson: sentTimeFromJson) DateTime? sentTime,
  }) = _Notification;

  factory Notification.fromJson(Map<String, Object?> json) =>
      _$$_NotificationFromJson(json);
}
