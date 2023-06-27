import 'dart:developer';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:flutter_vikings/features/session/widgets/rate_dialog.dart';
import 'package:intl/intl.dart';

import '../../ticket/providers/ticket_provider.dart';
import '../providers/session_rate_provider.dart';
import '../widgets/session_added_banner.dart';
import '../widgets/session_live_banner.dart';
import '../widgets/session_rate_banner.dart';

class SessionDetailsPage extends ConsumerStatefulWidget {
  const SessionDetailsPage({
    super.key,
    required this.session,
    required this.speakers,
  });

  final Session session;
  final List<Speaker> speakers;

  @override
  ConsumerState<SessionDetailsPage> createState() => _SessionDetailsPageState();
}

class _SessionDetailsPageState extends ConsumerState<SessionDetailsPage> {
  bool isLoading = false;

  void onSetReminder() {
    ref.watch(myAgenda.notifier).add(widget.session);
    context.addedToAgenda(widget.session.title);
    PrimaryScrollController.of(context).animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  void rate() async {
    double rate = 5.0;

    final review = await showDialog(
      context: context,
      builder: (context) {
        return RateDialog(
          onRated: (value) {
            rate = value;
            log('$value');
          },
        );
      },
    );

    if (review != null) {
      setState(() {
        isLoading = true;
      });
      ref
          .watch(rateService)
          .rateSession(
            SessionRate(
              sessionId: widget.session.id,
              rate: rate,
              review: review,
              ticketReference: ref.watch(currentTicket)!.reference,
            ),
          )
          .then((value) {
        setState(() {
          isLoading = false;
        });
        context.thanksForRating();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('E d, MMM y, @ hh:mm a');

    final subtitleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          height: 2,
          fontWeight: FontWeight.bold,
        );
    final contentStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.textColorLowEmphacy,
        );
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: ListView(
              controller: PrimaryScrollController.of(context),
              padding: EdgeInsets.fromLTRB(
                0,
                MediaQuery.of(context).padding.top,
                0,
                MediaQuery.of(context).padding.bottom,
              ),
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: AppAdaptiveIconButton(
                          onPressed: context.pop,
                          child: const Icon(Icons.arrow_back_ios_rounded),
                        ),
                      ),
                    ),
                  ],
                ),
                if (widget.session.status == SessionStatus.upcoming)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SessionAddedBanner(
                      show: ref.watch(isAddedToMyAgenda(widget.session)),
                      onDelete: () {
                        ref.watch(myAgenda.notifier).remove(widget.session);
                        context.removedFromAgenda(widget.session.title);
                      },
                    ),
                  ),
                if (widget.session.status == SessionStatus.live)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SessionLiveBanner(
                      show: widget.session.liveUrl != null,
                      liveUrl: widget.session.liveUrl,
                    ),
                  ),
                if (widget.session.status == SessionStatus.gone)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SessionRateBanner(
                      onRate: rate,
                      show: ref.watch(isRated(widget.session.id)).value ==
                              false &&
                          ref.watch(canRate(widget.session.id)),
                    ),
                  ),
                SpeakerProfileImage(
                  images: widget.speakers
                      .map((speaker) => speaker.profilePicture)
                      .toList(),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    widget.session.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Text(
                  widget.speakers.map((e) => e.fullName).join(' — '),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textColorMediumEmphacy,
                      ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SkewedContainer(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.session.description != null &&
                              widget.session.description!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Brief',
                                    style: subtitleStyle,
                                  ),
                                  Text(
                                    widget.session.description ?? '',
                                    style: contentStyle,
                                  ),
                                ],
                              ),
                            ),
                          Text(
                            'Room',
                            style: subtitleStyle,
                          ),
                          Text(
                            eventRooms[widget.session.roomId.toString()]
                                    ?.name ??
                                '',
                            style: contentStyle,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Date and time',
                            style: subtitleStyle,
                          ),
                          Text(
                            dateFormat.format(widget.session.startsAt),
                            style: contentStyle,
                          ),
                          if (widget.session.status == SessionStatus.upcoming)
                            AnimatedSize(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInSine,
                              alignment: Alignment.topCenter,
                              child: ref
                                      .watch(isAddedToMyAgenda(widget.session))
                                  ? const Center()
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 40.0),
                                      child: Center(
                                        child: AppAdaptivePrimaryButton(
                                          noPadding: true,
                                          onPressed: onSetReminder,
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Text('Set reminder'),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          LoadingOverlay(show: isLoading),
        ],
      ),
    );
  }
}

class SpeakerProfileImage extends StatelessWidget {
  const SpeakerProfileImage({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final image in images)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: CustomPaint(
              painter: CustomSpeakerBorder(),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: CachedNetworkImageProvider(image),
              ),
            ),
          ),
      ],
    );
  }
}

class CustomSpeakerBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect drawingRect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 1.65,
    );

    final Paint paint = Paint();
    paint.color = AppColors.primaryColorMain;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 9;
    paint.strokeCap = StrokeCap.round;

    canvas.drawArc(
      drawingRect,
      -math.pi * 260 / 180,
      math.pi * 1.7,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
