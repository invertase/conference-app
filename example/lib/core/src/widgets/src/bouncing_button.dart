import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'raw_button.dart';

/// A button with bouncing effect.
///
/// Use on iOS only.
class BouncingButton extends StatefulWidget {
  const BouncingButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.decoration,
    this.textColor,
  }) : super(key: key);

  final Widget child;
  final void Function()? onTap;

  final BoxDecoration? decoration;
  final Color? textColor;

  @override
  BouncingButtonState createState() => BouncingButtonState();
}

class BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _scale = 1;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 50,
      ),
      reverseDuration: const Duration(
        milliseconds: 20,
      ),
      lowerBound: 0.0,
      upperBound: 0.02,
    )..addListener(_animationListener);

    super.initState();
  }

  void _animationListener() {
    setState(() {
      _scale = 1 - _controller.value;
    });
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onTap != null) {
      HapticFeedback.lightImpact();
      _controller.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onTap != null) {
      _controller.reverse();
    }
  }

  void _onTapCancel() {
    if (widget.onTap != null) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_animationListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _scale,
      child: RawButton(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: widget.onTap,
        decoration: widget.decoration,
        textColor: widget.textColor,
        enableHighlight: false,
        child: widget.child,
      ),
    );
  }
}
