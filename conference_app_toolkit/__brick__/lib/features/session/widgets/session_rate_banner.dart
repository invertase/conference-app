import 'package:conference_app/core/core.dart';
import 'package:flutter/material.dart';

import 'session_banner.dart';

class SessionRateBanner extends StatelessWidget {
  const SessionRateBanner({
    super.key,
    this.show = false,
    this.onRate,
  });
  final bool show;
  final VoidCallback? onRate;

  @override
  Widget build(BuildContext context) {
    return SessionBanner(
      show: show,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AppAdaptiveTextButton(
          noPadding: true,
          onPressed: onRate,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppRadius.kRadiusMedium,
              color: Colors.blueAccent.withOpacity(0.1),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: AppRadius.kRadiusMedium,
                    color: Colors.blueAccent.withOpacity(0.9),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsetsDirectional.only(end: 10),
                  child: const Icon(
                    Icons.star_rounded,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Did you enjoy this session?'
                    '\nRate it!',
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
