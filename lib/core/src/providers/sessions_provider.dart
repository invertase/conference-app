import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/day_room.dart';
import '../models/session.dart';
import '../services/sessions_service.dart';

final sessionService = Provider<SessionsService>((ref) {
  return SessionsService(FirebaseFirestore.instance);
});

final sessionsProvider = StreamProvider<List<Session>>((ref) {
  return ref.watch(sessionService).sessions;
});

extension Filter on List<Session> {
  List<Session> filterBy(DayRoom dayRoom) {
    return where((s) =>
        s.startsAt.day == dayRoom.day.date.day &&
        (dayRoom.room != null ? s.roomId == dayRoom.room?.id : true)).toList();
  }
}
