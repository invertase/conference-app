import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/src/app_colors.dart';
import '../../theme/src/app_radius.dart';
import '../../theme/src/app_theme.dart';

class AppAdaptiveOutlineButton extends StatelessWidget {
  const AppAdaptiveOutlineButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.noPadding = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final bool noPadding;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoTheme(
        data: Theme.of(context).cupertinoTheme,
        child: CupertinoButton(
          borderRadius: BorderRadius.circular(15),
          padding: noPadding ? EdgeInsets.zero : null,
          onPressed: onPressed == null
              ? null
              : () {
                  HapticFeedback.lightImpact();
                  onPressed?.call();
                },
          disabledColor: Colors.grey,
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyMedium!,
            child: child,
          ),
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        child: child,
      );
    }
  }
}

class AppAdaptivePrimaryButton extends StatelessWidget {
  const AppAdaptivePrimaryButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.noPadding = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final bool noPadding;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoTheme(
        data: Theme.of(context).cupertinoTheme,
        child: CupertinoButton.filled(
          borderRadius: BorderRadius.circular(15),
          padding: noPadding ? EdgeInsets.zero : null,
          onPressed: onPressed == null
              ? null
              : () {
                  HapticFeedback.lightImpact();
                  onPressed?.call();
                },
          child: child,
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: child,
      );
    }
  }
}

class AppAdaptiveIconButton extends StatelessWidget {
  const AppAdaptiveIconButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.fillColor,
    this.disabledColor,
    this.borderColor,
    this.noPadding = false,
    this.borderRadius,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final Color? fillColor;
  final Color? disabledColor;

  final Color? borderColor;
  final bool noPadding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoTheme(
        data: Theme.of(context).cupertinoTheme,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? AppRadius.kRadiusMedium,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: 1,
            ),
          ),
          child: CupertinoButton(
            disabledColor: disabledColor ?? Colors.grey[400]!,
            borderRadius: borderRadius ?? AppRadius.kRadiusMedium,
            padding: noPadding ? EdgeInsets.zero : const EdgeInsets.all(10.0),
            onPressed: onPressed != null
                ? () {
                    HapticFeedback.lightImpact();
                    onPressed?.call();
                  }
                : null,
            color: fillColor,
            child: child,
          ),
        ),
      );
    } else {
      return Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? AppRadius.kRadiusMedium,
          color: onPressed != null ? fillColor : disabledColor,
          border: borderColor == null
              ? null
              : Border.all(
                  color: borderColor ?? Colors.transparent,
                  width: 1,
                ),
        ),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? AppRadius.kRadiusMedium,
          ),
          type: MaterialType.button,
          color: Colors.transparent,
          child: InkWell(
            borderRadius: borderRadius ?? AppRadius.kRadiusMedium,
            enableFeedback: true,
            onTap: onPressed != null
                ? () {
                    HapticFeedback.lightImpact();
                    onPressed?.call();
                  }
                : null,
            splashColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(noPadding ? 0 : 6.0),
              child: child,
            ),
          ),
        ),
      );
    }
  }
}

class AppAdaptiveTextButton extends StatelessWidget {
  const AppAdaptiveTextButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.noPadding = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final bool noPadding;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoTheme(
        data: Theme.of(context).cupertinoTheme,
        child: CupertinoButton(
          padding: noPadding ? EdgeInsets.zero : null,
          onPressed: onPressed == null
              ? null
              : () {
                  HapticFeedback.lightImpact();
                  onPressed?.call();
                },
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: onPressed == null
                      ? Colors.grey[300]
                      : Theme.of(context).brightness == Brightness.dark
                          ? CupertinoColors.white
                          : AppColors.primaryColorMain,
                ),
            child: child,
          ),
        ),
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        child: child,
      );
    }
  }
}
