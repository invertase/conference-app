import 'package:cached_network_image/cached_network_image.dart';
import 'package:conference_app/core/core.dart';
import 'package:flutter/material.dart';

class AgendaSessionSpeaker extends StatelessWidget {
  const AgendaSessionSpeaker({
    super.key,
    required this.speakerName,
    required this.speakerJob,
    this.speakerImageUrl,
  });

  final String speakerName;
  final String speakerJob;
  final String? speakerImageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: CircleAvatar(
              radius: 30,
              child: speakerImageUrl == null
                  ? const SizedBox()
                  : CachedNetworkImage(
                      imageUrl: speakerImageUrl!,
                      placeholder: (context, url) {
                        return const Center(
                          child: SizedBox(
                            width: 30,
                            height: 30,
                          ),
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  speakerName,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textColorMediumEmphacy,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  speakerJob,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textColorLowEmphacy,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
