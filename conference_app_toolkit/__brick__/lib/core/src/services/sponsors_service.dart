import 'package:cloud_firestore/cloud_firestore.dart';

import '../configs/firestore_collections.dart';
import '../models/sponsor.dart';

class SponsorsService {
  const SponsorsService(this._firestore);
  final FirebaseFirestore _firestore;

  Stream<List<Sponsor>> get sponsors {
    return _firestore
        .collection(FirestoreCollections.sponsors)
        .withConverter<Sponsor>(
          fromFirestore: (snapshot, _) => Sponsor.fromJson(snapshot.data()!),
          toFirestore: (sponsor, _) => sponsor.toJson(),
        )
        .orderBy('level')
        .snapshots()
        .map((event) => event.docs.map((doc) => doc.data()).toList());
  }
}
