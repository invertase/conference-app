import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/messaging_service.dart';

final messagingService = Provider<MessagingService>((_) {
  return const MessagingService();
});
