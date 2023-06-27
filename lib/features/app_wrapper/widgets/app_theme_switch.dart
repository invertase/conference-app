import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';

class AppThemeSwitch extends ConsumerStatefulWidget {
  const AppThemeSwitch({Key? key}) : super(key: key);

  @override
  ConsumerState<AppThemeSwitch> createState() => _AppThemeSwitchState();
}

class _AppThemeSwitchState extends ConsumerState<AppThemeSwitch> {
  final darkThemeIcon = Icons.nights_stay_outlined;
  final lightThemeIcon = Icons.wb_sunny_outlined;
  final duration = const Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    Color knobColor;
    IconData knobIcon;
    Alignment knobAligment;

    if (isDarkTheme) {
      knobColor = Theme.of(context).primaryColor;
      knobIcon = darkThemeIcon;
      knobAligment = Alignment.centerLeft;
    } else {
      knobColor = const Color(0xffE0E0E0);
      knobIcon = lightThemeIcon;
      knobAligment = Alignment.centerRight;
    }

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();

        ref
            .watch(themeSwitcher.notifier)
            .switchTheme(isDarkTheme ? ThemeMode.light : ThemeMode.dark);
      },
      child: AnimatedContainer(
        duration: duration,
        width: 85,
        height: 40,
        decoration: BoxDecoration(
          border: isDarkTheme ? null : Border.all(color: knobColor, width: .5),
          borderRadius: BorderRadius.circular(200),
          color: isDarkTheme
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  darkThemeIcon,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                Icon(
                  lightThemeIcon,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            AnimatedAlign(
              duration: duration,
              alignment: knobAligment,
              curve: Curves.ease,
              child: AnimatedContainer(
                duration: duration,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: knobColor,
                ),
                child: AnimatedSwitcher(
                  duration: duration,
                  child: Icon(
                    knobIcon,
                    key: ValueKey(ref.watch(themeSwitcher)),
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
