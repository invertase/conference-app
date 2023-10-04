import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class SkewedContainer extends StatelessWidget {
  const SkewedContainer({
    super.key,
    required this.child,
    this.skew,
    this.height,
  });

  final Widget child;
  final double? skew;
  final double? height;

  @override
  Widget build(BuildContext context) {
    const defaultSkew = 30;

    return Transform(
      transform: Matrix4.skewY(-(skew ?? defaultSkew) / 350),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).cardColor.withOpacity(
                Theme.of(context).brightness == Brightness.dark ? 0.04 : 1,
              ),
          boxShadow: [AppShadows.primaryBlack],
        ),
        child: Transform(
          transform: Matrix4.skewY((skew ?? defaultSkew) / 350),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 20, 20),
            child: child,
          ),
        ),
      ),
    );
  }
}
