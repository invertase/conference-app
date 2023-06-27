import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vikings/core/core.dart';

class MeetSpeakerCard extends StatelessWidget {
  const MeetSpeakerCard({
    super.key,
    required this.speaker,
    this.isCurrentSpeaker = false,
  });

  final Speaker speaker;
  final bool isCurrentSpeaker;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        context.pushSpeaker(speaker);
      },
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            alignment: AlignmentDirectional.bottomStart,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isCurrentSpeaker
                    ? Theme.of(context).primaryColorLight
                    : AppColors.backgroundWhite,
                width: 3,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Theme.of(context).primaryColor.withOpacity(0.8),
                ],
              ),
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [AppShadows.secondaryBlue],
              borderRadius: BorderRadius.circular(20),
            ),
            child: CachedNetworkImage(
              imageUrl: speaker.profilePicture,
              fit: BoxFit.fitHeight,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  speaker.fullName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      const BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
                Text(
                  speaker.tagLine,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
