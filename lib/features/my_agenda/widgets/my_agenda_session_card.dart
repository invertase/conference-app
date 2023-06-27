import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:intl/intl.dart';

import 'session_status_badge.dart';

class MyAgendaSessionCard extends StatelessWidget {
  const MyAgendaSessionCard({
    super.key,
    required this.session,
    required this.speakers,
    this.isFullWidth = false,
    this.onDelete,
  });

  final Session session;
  final List<Speaker> speakers;
  final bool isFullWidth;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMEd();
    final timeFormat = DateFormat('HH:mm a');

    final timeTextStyle = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(color: Theme.of(context).primaryColorLight);

    return Container(
      width: isFullWidth
          ? double.infinity
          : MediaQuery.of(context).size.width * .75,
      decoration: BoxDecoration(
        borderRadius: AppRadius.kRadiusMedium,
        color: Theme.of(context).cardColor.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.04 : 1,
            ),
        boxShadow: [AppShadows.primaryBlack],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 25, 20, 10),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 30,
                  maxHeight: 30,
                ),
                child: SizedBox(
                  child: AppAdaptiveIconButton(
                    onPressed: onDelete,
                    noPadding: true,
                    child: const Icon(
                      Icons.delete_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final s in speakers)
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      constraints: const BoxConstraints(
                        maxWidth: 40,
                        maxHeight: 40,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: CachedNetworkImage(imageUrl: s.profilePicture),
                    )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SessionStatusBadge(status: session.status),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        session.title,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        speakers.map((e) => e.fullName).join(' — '),
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dateFormat.format(session.startsAt)),
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
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
