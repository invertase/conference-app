import 'package:cloud_firestore/cloud_firestore.dart';

import '../configs/firestore_collections.dart';
import '../models/room.dart';

class RoomsService {
  const RoomsService(this._firestore);
  final FirebaseFirestore _firestore;

  Stream<List<Room>> get rooms {
    return _firestore
        .collection(FirestoreCollections.rooms)
        .withConverter<Room>(
          fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
          toFirestore: (room, _) => room.toJson(),
        )
        .orderBy('sort')
        .snapshots()
        .map((event) {
      final docs = event.docs.map((doc) => doc.data()).toList();
      return docs;
    });
  }
}
