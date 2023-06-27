import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';

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
                  for (String roomId in data.keys)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            eventRooms[roomId]?.name ?? '',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(
                          height: 250,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                              vertical: 25,
                              horizontal: 20,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: data[roomId]?.length ?? 0,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 20),
                            itemBuilder: (context, index) {
                              final session = data[roomId]?[index];
                              if (session != null) {
                                final speakers =
                                    ref.watch(sessionSpeakers(session));
                                return PushSessionGestureDetector(
                                  sessionDetails: SessionDetails(
                                    session: session,
                                    speakers: speakers,
                                  ),
                                  child: MyAgendaSessionCard(
                                    session: session,
                                    speakers: speakers,
                                    isFullWidth: false,
                                    onDelete: () {
                                      ref
                                          .watch(myAgenda.notifier)
                                          .remove(session);
                                    },
                                  ),
                                );
                              }

                              return const SizedBox();
                            },
                          ),
                        ),
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
  bool get wantKeepAlive => true;
}
