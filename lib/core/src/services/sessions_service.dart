import 'package:cloud_firestore/cloud_firestore.dart';

import '../configs/firestore_collections.dart';
import '../models/session.dart';

class SessionsService {
  const SessionsService(this._firestore);
  final FirebaseFirestore _firestore;

  Stream<List<Session>> get sessions {
    return _firestore
        .collection(FirestoreCollections.sessions)
        .withConverter<Session>(
          fromFirestore: (snapshot, _) => Session.fromJson(snapshot.data()!),
          toFirestore: (session, _) => session.toJson(),
        )
        .orderBy('startsAt')
        .snapshots()
        .map((event) {
      final docs = event.docs.map((doc) => doc.data()).toList();
      return docs;
    });
  }

  Future<Session> getSession(String sessionId) async {
    final doc = await _firestore
        .doc('${FirestoreCollections.sessions}/$sessionId')
        .get();
    return Session.fromJson(doc.data()!);
  }
}
