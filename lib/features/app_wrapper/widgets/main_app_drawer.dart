import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:flutter_vikings/core/src/models/tab_item.dart';
import 'package:flutter_vikings/features/app_wrapper/models/drawer_item.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../configs/drawer_items.dart';
import 'app_theme_switch.dart';
import 'main_app_drawer_list_item.dart';

final packageInfo =
    FutureProvider<PackageInfo>((ref) => PackageInfo.fromPlatform());

class MainAppDrawer extends ConsumerWidget {
  const MainAppDrawer({
    super.key,
    this.itemChanged,
  });
  final ValueChanged<DrawerItem>? itemChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appVersion = ref.watch(packageInfo).value;

    return ClipPath(
      clipper: _CustomDrawerClipper(),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            20,
            MediaQuery.of(context).size.height * .15,
            MediaQuery.of(context).size.width * .2 + 20,
            MediaQuery.of(context).size.height * .15,
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.logo,
                  height: MediaQuery.of(context).size.width * .08,
                ),
                const AppThemeSwitch(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: AppAdaptiveIconButton(
                    onPressed: Scaffold.of(context).closeDrawer,
                    noPadding: true,
                    borderColor:
                        Brightness.light == Theme.of(context).brightness
                            ? AppColors.textColorLowEmphacy.withOpacity(0.2)
                            : null,
                    fillColor: Brightness.dark == Theme.of(context).brightness
                        ? Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.1)
                        : null,
                    child: Icon(
                      Icons.close_rounded,
                      color: Brightness.dark == Theme.of(context).brightness
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            for (final item in drawerItems)
              MainAppDrawerListItem(
                item: item,
                extra: item.title == 'My Page'
                    ? '${ref.watch(myAgendaLength)}'
                    : null,
                onPressed: () {
                  Scaffold.of(context).closeDrawer();
                  if (item.tabItemId != null) {
                    itemChanged?.call(item);
                    ref
                        .watch(appCurrentTab.notifier)
                        .update((state) => state = item.tabItemId!.index);
                  } else if (item.route.isNotEmpty) {
                    GoRouter.of(context).pushNamed(item.route, pathParameters: {
                      'tab': TabItemId.values[ref.watch(appCurrentTab)].name,
                    });
                  }
                },
              ),
            if (appVersion?.version != null)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'v${appVersion!.version}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.textColorLowEmphacy,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CustomDrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.cubicTo(
      size.width * .8,
      size.height * .04 + 20,
      size.width * .8,
      size.height * .04 + 20,
      size.width * .8,
      size.height * .25,
    );
    path.lineTo(
      size.width * .8,
      size.height * .7,
    );
    path.cubicTo(
      size.width * .8,
      size.height * .85 + 20,
      size.width * .8,
      size.height * .85 + 20,
      0,
      size.height,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
