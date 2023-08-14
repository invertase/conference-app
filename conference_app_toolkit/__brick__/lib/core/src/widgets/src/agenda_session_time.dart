import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionAgendaTime extends StatelessWidget {
  const SessionAgendaTime({
    super.key,
    required this.startAt,
    required this.endAt,
  });

  final DateTime startAt;
  final DateTime endAt;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('HH:mm a');
    final timeStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).primaryColorLight,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              const TextSpan(text: 'Start time:  '),
              TextSpan(
                text: format.format(startAt),
                style: timeStyle,
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              const TextSpan(text: 'End time:  '),
              TextSpan(
                text: format.format(endAt),
                style: timeStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
