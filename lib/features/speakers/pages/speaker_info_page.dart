import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:intl/intl.dart';

class SpeakerInfoPage extends ConsumerStatefulWidget {
  const SpeakerInfoPage({
    super.key,
    required this.speaker,
  });

  final Speaker speaker;

  @override
  ConsumerState<SpeakerInfoPage> createState() => _SpeakerInfoPageState();
}

class _SpeakerInfoPageState extends ConsumerState<SpeakerInfoPage> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        );
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          AppSliverAppBar(
            title: widget.speaker.fullName,
            scrollController: scrollController,
            backgroundImage: widget.speaker.profilePicture,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: 300,
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              0,
              10,
              0,
              MediaQuery.of(context).padding.bottom,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Text(
                      widget.speaker.fullName,
                      style: titleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      widget.speaker.tagLine,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SpeakerInfoCard(
                    content: [
                      Text(
                        'About me',
                        style: titleStyle,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.speaker.bio,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SpeakerInfoCard(
                    content: [
                      Text(
                        'Sessions',
                        style: titleStyle,
                      ),
                      for (Session s in (ref
                              .watch(sessionsProvider)
                              .value
                              ?.where(
                                  (s) => s.speakers.contains(widget.speaker.id))
                              .toList() ??
                          []))
                        SpeakerSessionCard(session: s),
                    ],
                  ),
                  SpeakerInfoCard(
                    content: [
                      Text(
                        'Connect with me',
                        style: titleStyle,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          for (final s in widget.speaker.links)
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 10),
                              child: ConnectLinkButton(
                                type: Links.values.byName(
                                    (s['linkType'] as String).toLowerCase()),
                                url: s['url'],
                              ),
                            ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpeakerSessionCard extends ConsumerWidget {
  const SpeakerSessionCard({
    Key? key,
    required this.session,
  }) : super(key: key);

  final Session session;

  @override
  Widget build(BuildContext context, ref) {
    final dateFormat = DateFormat('E d, MMM y, @ hh:mm a');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            session.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 15),
          Text(
            session.description ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 15),
          Text(
            'Talk date',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            dateFormat.format(session.startsAt),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 15),
          Text(
            'Room',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            eventRooms[session.roomId.toString()]!.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: AppAdaptiveTextButton(
              child: Text(
                ref.watch(isAddedToMyAgenda(session))
                    ? 'Remove reminder'
                    : 'Set reminder',
                textAlign: TextAlign.end,
              ),
              onPressed: () {
                if (ref.watch(isAddedToMyAgenda(session))) {
                  ref.watch(myAgenda.notifier).remove(session);
                  context.removedFromAgenda(session.title);
                } else {
                  ref.watch(myAgenda.notifier).add(session);
                  context.addedToAgenda(session.title);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class SpeakerInfoCard extends StatelessWidget {
  const SpeakerInfoCard({
    Key? key,
    required this.content,
  }) : super(key: key);

  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SkewedContainer(
        skew: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content,
          ),
        ),
      ),
    );
  }
}
