import 'package:cloud_firestore/cloud_firestore.dart';

import '../configs/firestore_collections.dart';
import '../models/session_rate.dart';

class RateService {
  const RateService(this._firestore);
  final FirebaseFirestore _firestore;

  CollectionReference<SessionRate> get ratesRef => _firestore
      .collection(FirestoreCollections.sessionRate)
      .withConverter<SessionRate>(
        fromFirestore: (snapshot, _) => SessionRate.fromJson(snapshot.data()!),
        toFirestore: (rate, _) => rate.toJson(),
      );

  Future<void> rateSession(SessionRate rate) async {
    await Future.delayed(const Duration(seconds: 1));
    await ratesRef.add(rate);
  }

  Stream<bool> isRated(String sessionId, String? ticketReference) {
    final snapshot = ratesRef
        .where('sessionId', isEqualTo: sessionId)
        .where('ticketReference', isEqualTo: ticketReference)
        .snapshots();

    return snapshot.map((event) => event.docs.length == 1);
  }
}
