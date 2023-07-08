import 'package:conference_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_room.freezed.dart';

@freezed
class DayRoom with _$DayRoom {
  const factory DayRoom({
    required Day day,
    required Room? room,
  }) = _DayRoom;
}
