import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/session.dart';
import '../models/speaker.dart';
import '../services/speakers_service.dart';

final speakersService = Provider((ref) {
  return SpeakersService(FirebaseFirestore.instance);
});

final speakersProvider = StreamProvider<Map<String, Speaker>>((ref) {
  return ref.watch(speakersService).speakers;
});

final sessionSpeakers = Provider.family<List<Speaker>, Session>((ref, session) {
  return ref
          .watch(speakersProvider)
          .value
          ?.values
          .where((s) => session.speakers.contains(s.id))
          .toList() ??
      [];
});
