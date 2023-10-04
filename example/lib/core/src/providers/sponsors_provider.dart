import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/sponsor.dart';
import '../services/sponsors_service.dart';

final sponsorService = Provider<SponsorsService>((ref) {
  return SponsorsService(FirebaseFirestore.instance);
});

final sponsorsProvider = StreamProvider<List<Sponsor>>((ref) {
  return ref.watch(sponsorService).sponsors;
});
