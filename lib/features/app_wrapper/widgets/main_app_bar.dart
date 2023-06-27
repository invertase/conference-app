import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:conference_app/core/core.dart';

/// The main app bar that persists accross all tabs in the app.
class MainAppBar extends ConsumerWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AppAdaptiveIconButton(
                    fillColor: isDark ? Colors.white.withOpacity(0.02) : null,
                    borderColor: isDark ? null : Theme.of(context).dividerColor,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AppImageIcon(
                          icon: AppIcons.menu,
                          color:
                              Theme.of(context).appBarTheme.iconTheme?.color),
                    ),
                  ),
                ),
              ),
              SvgPicture.asset(
                AppImages.logo,
                width: 100,
                color: isDark ? Colors.white : null,
              ),
              const Spacer()
              // AppAdaptiveIconButton(
              //   fillColor: isDark ? Colors.white.withOpacity(0.02) : null,
              //   borderColor: isDark ? null : Theme.of(context).dividerColor,
              //   onPressed: () {
              //     context.pushNotifications(
              //       tab: TabItemId.values[ref.watch(appCurrentTab)],
              //     );
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(6.0),
              //     child: AppImageIcon(
              //       icon: AppIcons.notifications,
              //       color: Theme.of(context).appBarTheme.iconTheme?.color,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
