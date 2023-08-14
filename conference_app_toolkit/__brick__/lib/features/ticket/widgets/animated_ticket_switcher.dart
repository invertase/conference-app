import 'package:flutter/material.dart';

class AnimatedTicketSwitcher extends StatelessWidget {
  const AnimatedTicketSwitcher({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.elasticOut,
      switchOutCurve: Curves.ease,
      reverseDuration: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 1200),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: child,
    );
  }
}
