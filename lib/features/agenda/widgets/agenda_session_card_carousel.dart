import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'agenda_session_speaker.dart';

class AgendaSessionCardCarousel extends StatelessWidget {
  const AgendaSessionCardCarousel({
    super.key,
    required this.index,
    required this.session,
    required this.speakers,
  });

  final int index;
  final Session session;
  final List<Speaker> speakers;

  @override
  Widget build(BuildContext context) {
    final sessionNumberFormatter = NumberFormat("00");

    return SkewedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: 0.15,
            child: Text(
              sessionNumberFormatter.format(index),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontFamily: GoogleFonts.caesarDressing().fontFamily,
                    height: 1.1,
                    fontSize: 100,
                  ),
            ),
          ),
          Text(
            session.title.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: speakers.isEmpty
                ? Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.caesarDressing().fontFamily,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppColors.primaryColorMain,
                      fontSize: 28,
                    )
                : Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SizedBox(
              child: Row(
                children: [
                  for (final s in speakers)
                    Expanded(
                      child: AgendaSessionSpeaker(
                        speakerName: s.fullName,
                        speakerJob: s.tagLine,
                        speakerImageUrl: s.profilePicture,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SessionAgendaTime(
                startAt: session.startsAt,
                endAt: session.endsAt,
              ),
              if (session.status == SessionStatus.upcoming)
                AgendaAddButton(session: session)
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
