import 'package:cloud_firestore/cloud_firestore.dart';

import '../configs/firestore_collections.dart';
import '../models/speaker.dart';

class SpeakersService {
  const SpeakersService(this._firestore);
  final FirebaseFirestore _firestore;

  CollectionReference<Speaker> get speakersRef => _firestore
      .collection(FirestoreCollections.speakers)
      .withConverter<Speaker>(
        fromFirestore: (snapshot, _) => Speaker.fromJson(snapshot.data()!),
        toFirestore: (speaker, _) => speaker.toJson(),
      );

  Stream<Map<String, Speaker>> get speakers {
    return speakersRef.snapshots().map((event) {
      final map = <String, Speaker>{};
      for (final doc in event.docs) {
        map.addAll({doc.id: doc.data()});
      }
      return map;
    });
  }

  Future<List<Speaker>> getSpeakersById(List<String> ids) async {
    final doc = await speakersRef.where('id', whereIn: ids).get();
    return doc.docs.map((e) => e.data()).toList();
  }
}
