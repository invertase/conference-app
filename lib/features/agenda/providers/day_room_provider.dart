import 'package:conference_app/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension DateOnlyCompare on DateTime {
  /// Return if 2 dates are the same day.
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

final dayRoomProvider = StateProvider<DayRoom>((ref) {
  Day currentDay = eventDays.first;

  for (final day in eventDays) {
    if (day.date.isSameDate(DateTime.now())) {
      currentDay = day;
    }
  }

  return DayRoom(
    day: currentDay,
    room: eventRooms.isNotEmpty ? eventRooms.values.first : null,
  );
});
