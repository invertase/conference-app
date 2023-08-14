import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImageIcon extends StatelessWidget {
  const AppImageIcon({
    super.key,
    required this.icon,
    this.color,
  });

  final String icon;
  final Color? color;

  /// Whether this icon is SVG or not.
  bool get _isSvg => icon.endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: _isSvg
          ? SvgPicture.asset(
              icon,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            )
          : Image.asset(
              icon,
              color: color,
            ),
    );
  }
}
