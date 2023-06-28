import 'package:conference_app/core/core.dart';

import '../models/drawer_item.dart';

List<DrawerItem> drawerItems = [
  const DrawerItem(
    id: DrawerItemId.myPage,
    title: 'My Page',
    icon: AppIcons.myPages,
    route: 'route',
    tabItemId: TabItemId.myAgenda,
  ),
  const DrawerItem(
    id: DrawerItemId.codeOfConduct,
    title: 'Code of conduct',
    icon: AppIcons.codeOfConduct,
    route: RouteNames.codeOfConduct,
  ),
  const DrawerItem(
    id: DrawerItemId.credit,
    title: 'Credit',
    icon: AppIcons.sendFeedback,
    route: RouteNames.credit,
  ),
];
