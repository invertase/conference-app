import 'package:flutter/material.dart';
import 'package:conference_app/core/core.dart';

import 'animated_ticket_switcher.dart';

class ErrorBanner extends StatelessWidget {
  const ErrorBanner({
    super.key,
    required this.message,
    this.clearMessage,
  });

  final String? message;
  final VoidCallback? clearMessage;

  @override
  Widget build(BuildContext context) {
    return AnimatedTicketSwitcher(
      child: message == null
          ? const Center()
          : Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: AppRadius.kRadiusExtraSmall,
              ),
              width: MediaQuery.of(context).size.width * .8,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10.0),
                      child: Text(
                        message ?? '',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  AppAdaptiveIconButton(
                    onPressed: clearMessage,
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
