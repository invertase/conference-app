import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';

import '../../ticket/providers/ticket_provider.dart';

final rateService =
    Provider<RateService>((_) => RateService(FirebaseFirestore.instance));

/// Check if the user can rate this session.
final canRate =
    StateProvider.autoDispose.family<bool, String>((ref, sessionId) {
  return ref.watch(currentTicket) != null;
});

/// Check if the user has already rated the session.
final isRated = StreamProvider.autoDispose.family<bool, String>(
    (ref, sessionId) => ref
        .watch(rateService)
        .isRated(sessionId, ref.watch(currentTicket)?.reference));
