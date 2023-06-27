import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';

import '../widgets/meet_speaker_card.dart';

class SpeakersPage extends ConsumerStatefulWidget {
  const SpeakersPage({super.key});

  @override
  ConsumerState<SpeakersPage> createState() => _SpeakersPageState();
}

class _SpeakersPageState extends ConsumerState<SpeakersPage>
    with AutomaticKeepAliveClientMixin {
  Speaker? currentSpeaker;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final speakers = ref.watch(speakersProvider).value?.values.toList() ?? [];

    if (speakers.isEmpty) {
      return const Center(child: Text('No speakers :('));
    }

    currentSpeaker ??= speakers.first;

    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            aspectRatio: MediaQuery.of(context).size.aspectRatio * 1.9,
            viewportFraction: .7,
            onPageChanged: (index, reason) {
              setState(() {
                currentSpeaker = speakers[index];
              });
            },
          ),
          itemCount: speakers.length,
          itemBuilder: (context, index, i) {
            final speaker = speakers[index];

            return MeetSpeakerCard(
              isCurrentSpeaker: speaker == currentSpeaker,
              speaker: speaker,
            );
          },
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            height: 50,
            width: 200,
            child: AppAdaptiveOutlineButton(
              child: const Text('Meet Speaker'),
              onPressed: () {
                if (currentSpeaker != null) {
                  context.pushSpeaker(currentSpeaker!);
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
