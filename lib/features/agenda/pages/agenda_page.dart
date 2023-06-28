import 'package:conference_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/day_room_provider.dart';
import '../widgets/agenda_card.dart';
import '../widgets/agenda_day_picker.dart';
import '../widgets/agenda_header.dart';
import '../widgets/agenda_room_picker.dart';

class AgendaPage extends ConsumerStatefulWidget {
  const AgendaPage({super.key});

  @override
  ConsumerState<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends ConsumerState<AgendaPage>
    with AutomaticKeepAliveClientMixin {
  late final PageController pageController;
  AgendaSpeakersView view = AgendaSpeakersView.list;
  int activeCardIndex = 0;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final dayRoom = ref.watch(dayRoomProvider);
    final sessions = (ref.watch(sessionsProvider).value ?? [])
        .filterBy(ref.watch(dayRoomProvider));
    final dayRoomNotifier = ref.watch(dayRoomProvider.notifier);

    return CustomScrollView(
      controller: PrimaryScrollController.of(context),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                AgendaDayPicker(
                  initialDay: dayRoom.day,
                  onDaySelected: (value) {
                    if (value != dayRoom.day) {
                      pageController.jumpToPage(0);
                      dayRoomNotifier.update(
                          (state) => state = state.copyWith(day: value));
                    }
                  },
                ),
                const SizedBox(height: 20),
                if (eventRooms.length > 1)
                  AgendaRoomPicker(
                    onRoomSelected: (value) {
                      if (value != dayRoom.room) {
                        dayRoomNotifier.update(
                            (state) => state = state.copyWith(room: value));
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
        // SliverToBoxAdapter(
        //   child: AgendaHeader(
        //     view: view,
        //     onViewChanged: (value) {
        //       setState(() {
        //         view = value;
        //       });
        //     },
        //   ),
        // ),
        SliverToBoxAdapter(
          child: Visibility(
            maintainAnimation: true,
            maintainState: true,
            visible: view == AgendaSpeakersView.carousel,
            child: AnimatedScale(
              filterQuality: FilterQuality.medium,
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 900),
              curve: Curves.elasticOut,
              scale: view == AgendaSpeakersView.carousel ? 1.0 : 0.5,
              child: CarouselAgenda(
                pageController: pageController,
                sessions: sessions,
                key: const ValueKey(AgendaSpeakersView.carousel),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          sliver: SliverList(
            key: ValueKey('__list_${dayRoomProvider}__'),
            delegate: SliverChildListDelegate(
              [
                for (int i = 0; i < sessions.length; i++)
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    visible: view == AgendaSpeakersView.list,
                    child: AnimatedScale(
                      filterQuality: FilterQuality.medium,
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.elasticOut,
                      scale: view == AgendaSpeakersView.list ? 1.0 : 0.8,
                      child: GestureDetector(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          context.pushSession(
                            SessionDetails(
                              session: sessions[i],
                              speakers: ref.watch(sessionSpeakers(sessions[i])),
                            ),
                          );
                        },
                        child: AgendaCard(
                          index: i + 1,
                          session: sessions[i],
                          speakers: ref.watch(sessionSpeakers(sessions[i])),
                          isLarge: false,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CarouselAgenda extends ConsumerStatefulWidget {
  const CarouselAgenda({
    super.key,
    required this.pageController,
    required this.sessions,
  });

  final PageController pageController;
  final List<Session> sessions;

  @override
  ConsumerState<CarouselAgenda> createState() => _CarouselAgendaState();
}

class _CarouselAgendaState extends ConsumerState<CarouselAgenda> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.loose(const Size.fromHeight(470)),
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
      child: PageView(
        controller: widget.pageController,
        onPageChanged: (i) {
          setState(() {
            activeIndex = i;
          });
        },
        children: [
          for (int i = 0; i < widget.sessions.length; i++)
            GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                context.pushSession(
                  SessionDetails(
                    session: widget.sessions[i],
                    speakers: ref.watch(sessionSpeakers(widget.sessions[i])),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(15, 60, 15, 10),
                child: AnimatedScale(
                  key: ValueKey('__${widget.sessions[i].id}__'),
                  duration: const Duration(milliseconds: 300),
                  scale: activeIndex == i ? 1.0 : 0.8,
                  child: AgendaCard(
                    index: i + 1,
                    session: widget.sessions[i],
                    speakers: ref.watch(sessionSpeakers(widget.sessions[i])),
                    isLarge: true,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
