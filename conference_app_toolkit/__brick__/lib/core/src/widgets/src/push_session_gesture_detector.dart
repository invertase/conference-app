import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/session_details.dart';
import '../../router/app_router_extension.dart';

class PushSessionGestureDetector extends StatelessWidget {
  const PushSessionGestureDetector({
    super.key,
    required this.child,
    required this.sessionDetails,
  });
  final Widget child;
  final SessionDetails sessionDetails;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        context.pushSession(sessionDetails);
      },
      child: child,
    );
  }
}
