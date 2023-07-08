import '../../../core/src/models/tab_item.dart';

enum DrawerItemId {
  myPage,
  sponsors,
  activities,
  codeOfConduct,
  games,
  credit,
  aboutUs
}

class DrawerItem {
  const DrawerItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.route,
    this.tabItemId,
  });
  final DrawerItemId id;
  final String title;
  final String icon;
  final String route;
  final TabItemId? tabItemId;
}
