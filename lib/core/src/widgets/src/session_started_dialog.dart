import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:google_fonts/google_fonts.dart';

class SessionStartedDialog extends StatelessWidget {
  const SessionStartedDialog({
    super.key,
    required this.session,
    required this.speakers,
  });

  final Session session;
  final List<Speaker> speakers;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.kRadiusMedium,
      ),
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: _CustomClipper(),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.only(bottom: 30.0),
                decoration: BoxDecoration(
                  borderRadius: AppRadius.kRadiusMedium,
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        AppImages.logo,
                        width: MediaQuery.of(context).size.width * .15,
                      ),
                    ),
                    Text(
                      'The event:',
                      style: GoogleFonts.caesarDressing(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    AppAdaptiveTextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        context.pushSession(
                          SessionDetails(session: session, speakers: speakers),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: Text(
                            '${session.title} has started',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (final s in speakers)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  context.pushSpeaker(s);
                                },
                                child: AnimatedSpeakerTalkingAvatar(speaker: s),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Text(
                      '${speakers.map((e) => e.fullName).join(' & ')} ${speakers.length > 1 ? 'are' : 'is'} speaking...',
                      style: GoogleFonts.caesarDressing(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              child: AppAdaptiveIconButton(
                borderRadius: AppRadius.kRadiusLarge,
                onPressed: Navigator.of(context).pop,
                child: const SizedBox(
                  width: 30,
                  height: 30,
                  child: AppImageIcon(
                    icon: AppIcons.closeDialog,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnimatedSpeakerTalkingAvatar extends StatefulWidget {
  const AnimatedSpeakerTalkingAvatar({
    Key? key,
    required this.speaker,
  }) : super(key: key);

  final Speaker speaker;

  @override
  State<AnimatedSpeakerTalkingAvatar> createState() =>
      _AnimatedSpeakerTalkingAvatarState();
}

class _AnimatedSpeakerTalkingAvatarState
    extends State<AnimatedSpeakerTalkingAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      upperBound: 1.0,
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final width = 120.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width,
      child: AnimatedBuilder(
        animation: CurvedAnimation(
          parent: _controller,
          curve: Curves.fastOutSlowIn,
        ),
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: <Widget>[
              _buildContainer(width * _controller.value),
              _buildContainer((width + 20) * _controller.value),
              _buildContainer((width + 30) * _controller.value),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    CachedNetworkImageProvider(widget.speaker.profilePicture),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContainer(double width) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context)
            .primaryColorLight
            .withOpacity(1 - _controller.value),
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width / 2.45, size.height - 30)
      ..arcToPoint(
        Offset(size.width / 1.7, size.height - 30),
        clockwise: true,
        radius: const Radius.circular(20),
      )
      ..lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
