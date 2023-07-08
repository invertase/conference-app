import 'package:flutter/material.dart';

class RawButton extends StatelessWidget {
  const RawButton({
    Key? key,
    required this.child,
    this.onTap,
    this.onTapUp,
    this.onTapDown,
    this.onTapCancel,
    this.decoration,
    this.textColor,
    this.radius = 16,
    this.enableHighlight = true,
  }) : super(key: key);

  final Widget child;

  final void Function()? onTap;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final void Function()? onTapCancel;

  final Color? textColor;
  final BoxDecoration? decoration;
  final double radius;

  final bool enableHighlight;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: decoration,
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap == null
            ? null
            : () {
                onTapCancel?.call();
                onTap?.call();
              },
        highlightColor:
            enableHighlight ? textColor?.withOpacity(0.15) : Colors.transparent,
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Center(
            child: DefaultTextStyle.merge(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
