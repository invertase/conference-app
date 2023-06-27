import 'dart:math';

import 'package:conference_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'agenda_session_speaker.dart';

class AgendaSessionCardList extends StatelessWidget {
  const AgendaSessionCardList({
    super.key,
    required this.index,
    required this.session,
    required this.speakers,
  });

  final int index;
  final Session session;
  final List<Speaker>? speakers;

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('HH:mm a');
    final sessionNumberFormatter = NumberFormat("00");
    final timeTextStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: Theme.of(context).primaryColorLight);

    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(
                Theme.of(context).brightness == Brightness.dark ? 0.04 : 1,
              ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [AppShadows.primaryBlack],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    timeFormat.format(session.startsAt),
                    style: timeTextStyle,
                  ),
                  SizedBox(
                    width: 30,
                    child: Transform.rotate(
                      angle: -pi / 2,
                      child: SvgPicture.asset(
                        'assets/images/agenda_time_indicator.svg',
                        width: 5,
                      ),
                    ),
                  ),
                  Text(
                    timeFormat.format(session.endsAt),
                    style: timeTextStyle,
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Opacity(
                        opacity: 0.2,
                        child: Text(
                          sessionNumberFormatter.format(index),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontFamily:
                                        GoogleFonts.caesarDressing().fontFamily,
                                  ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            session.title,
                            style: speakers?.isEmpty ?? true
                                ? Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: GoogleFonts.caesarDressing()
                                          .fontFamily,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : AppColors.primaryColorMain,
                                      fontSize: 28,
                                    )
                                : Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 10),
                          if (speakers != null)
                            for (final s in speakers!)
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
                    const SizedBox(width: 10),
                    if (session.status == SessionStatus.upcoming)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Spacer(),
                          Expanded(child: AgendaAddButton(session: session))
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
