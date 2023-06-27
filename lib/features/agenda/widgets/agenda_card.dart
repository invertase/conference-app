import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';

import 'agenda_session_card_carousel.dart';
import 'agenda_session_card_list.dart';

class AgendaCard extends ConsumerWidget {
  const AgendaCard({
    super.key,
    required this.index,
    required this.session,
    required this.speakers,
    this.isLarge = true,
  });

  final int index;
  final Session session;
  final List<Speaker> speakers;
  final bool isLarge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isLarge) {
      return AgendaSessionCardCarousel(
        index: index,
        session: session,
        speakers: speakers,
      );
    } else {
      return AgendaSessionCardList(
        index: index,
        session: session,
        speakers: speakers,
      );
    }
  }
}
