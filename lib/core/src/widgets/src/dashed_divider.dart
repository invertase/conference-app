import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/core.dart';

class DashedDivider extends StatelessWidget {
  const DashedDivider({
    super.key,
    required this.width,
    this.paddedEnds = true,
  });
  final double width;
  final bool paddedEnds;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddedEnds ? 30 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            40,
            (_) {
              return SizedBox(
                width: 3,
                height: 1.4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: AppRadius.kRadiusLarge,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
