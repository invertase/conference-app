import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/room.dart';
import '../services/rooms_service.dart';

final roomsService = Provider<RoomsService>((ref) {
  return RoomsService(FirebaseFirestore.instance);
});

final roomsProvider = StreamProvider<List<Room>>((ref) {
  return ref.watch(roomsService).rooms;
});
