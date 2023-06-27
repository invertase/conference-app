import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'session_banner.dart';

class SessionLiveBanner extends ConsumerWidget {
  const SessionLiveBanner({
    super.key,
    this.show = false,
    required this.liveUrl,
  });

  final bool show;
  final String? liveUrl;

  @override
  Widget build(BuildContext context, ref) {
    return SessionBanner(
      show: show,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AppAdaptiveTextButton(
          noPadding: true,
          onPressed: () {
            if (liveUrl != null) {
              launchUrlString(liveUrl!);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppRadius.kRadiusMedium,
              color: Colors.yellow.withOpacity(0.1),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.kRadiusMedium,
                    color: Colors.yellow.withOpacity(0.9),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsetsDirectional.only(end: 10),
                  child: const Icon(
                    Icons.play_circle_fill_rounded,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Session is live!'
                    ' click here to watch the stream.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
