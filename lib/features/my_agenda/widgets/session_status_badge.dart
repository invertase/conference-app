import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/core.dart';

class SessionStatusBadge extends StatelessWidget {
  const SessionStatusBadge({super.key, required this.status});

  final SessionStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: AppRadius.kRadiusExtraSmall,
        color: status.color.withOpacity(0.1),
        boxShadow: [AppShadows.primaryBlack],
      ),
      child: Text(
        status.name.toUpperCase(),
        style: TextStyle(color: status.color, fontSize: 10),
      ),
    );
  }
}
