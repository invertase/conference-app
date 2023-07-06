import 'package:conference_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../widgets/my_agenda_session_card.dart';
import '../widgets/no_sessions.dart';

class MyAgenda extends ConsumerStatefulWidget {
  const MyAgenda({super.key});

  @override
  ConsumerState<MyAgenda> createState() => _MyAgendaState();
}

class _MyAgendaState extends ConsumerState<MyAgenda>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final format = DateFormat('E d, MMM y');

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      reverseDuration: const Duration(milliseconds: 200),
      switchInCurve: Curves.elasticOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) => ScaleTransition(
        alignment: Alignment.topCenter,
        scale: animation,
        child: child,
      ),
      child: ref.watch(myAgenda).when(
            data: (data) {
              return ListView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                children: [
                  for (DateTime day in data.keys)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  format.format(day),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Text(
                                '${data[day]?.length ?? 0} sessions',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        for (Session session in data[day] ?? [])
                          PushSessionGestureDetector(
                            sessionDetails: SessionDetails(
                              session: session,
                              speakers: ref.watch(sessionSpeakers(session)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: MyAgendaSessionCard(
                                session: session,
                                speakers: ref.watch(sessionSpeakers(session)),
                                isFullWidth: true,
                                onDelete: () {
                                  ref.watch(myAgenda.notifier).remove(session);
                                },
                              ),
                            ),
                          )
                      ],
                    )
                ],
              );
            },
            error: (message) => Text('$message'),
            empty: () => const NoSessions(),
            initial: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
