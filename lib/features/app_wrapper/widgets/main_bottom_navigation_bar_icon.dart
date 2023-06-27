import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/core.dart';

class MainBottomNavigatiopnBarIcon extends StatelessWidget {
  const MainBottomNavigatiopnBarIcon({
    super.key,
    required this.icon,
    this.color,
    required this.activeColor,
    this.onPressed,
    this.active = false,
  });

  final String icon;
  final Color? color;
  final Color? activeColor;
  final VoidCallback? onPressed;

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppAdaptiveIconButton(
          borderRadius: BorderRadius.circular(40),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child:
                AppImageIcon(icon: icon, color: active ? activeColor : color),
          ),
        ),
        AnimatedSlide(
          duration: const Duration(milliseconds: 1500),
          curve: Curves.elasticOut,
          offset: active ? const Offset(0, -1) : const Offset(0, 5),
          child: Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: activeColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
