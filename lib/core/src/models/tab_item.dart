import 'package:flutter/widgets.dart';

/// The tabs in the app.
enum TabItemId {
  agenda,
  myAgenda,
  ticket,
  sponsors,
  speakers,
}

/// A [TabItem] holds all the required information to display a tab.
/// The [view] is the widget that is displayed in the tab. The [icon] is the default
/// icon of this tab in the app's bottom navigation bar. The [activeIcon] is the
/// icon of the currently selected tab.
@immutable
class TabItem {
  const TabItem({
    required this.id,
    required this.view,
    required this.icon,
    this.iconColor,
    this.activeIconColor,
    this.tooltip,
  });

  final TabItemId id;
  final Widget view;
  final String icon;
  final Color? iconColor;
  final Color? activeIconColor;
  final String? tooltip;
}
