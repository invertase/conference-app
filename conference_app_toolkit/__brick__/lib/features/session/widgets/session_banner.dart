import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionBanner extends ConsumerWidget {
  const SessionBanner({
    super.key,
    required this.child,
    this.show = false,
  });

  final Widget child;
  final bool show;

  @override
  Widget build(BuildContext context, ref) {
    return AnimatedScale(
      filterQuality: FilterQuality.medium,
      alignment: Alignment.topCenter,
      scale: show ? 1 : 0,
      curve: Curves.elasticOut,
      duration: const Duration(milliseconds: 1200),
      child: AnimatedSize(
        alignment: Alignment.topCenter,
        curve: Curves.easeInOutCubicEmphasized,
        duration: const Duration(milliseconds: 400),
        child: !show ? const SizedBox() : child,
      ),
    );
  }
}
