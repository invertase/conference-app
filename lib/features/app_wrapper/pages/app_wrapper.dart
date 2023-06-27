import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:go_router/go_router.dart';

import '../../../core/src/models/tab_item.dart';
import '../configs/app_tabs.dart';
import '../models/drawer_item.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/main_app_drawer.dart';
import '../widgets/main_bottom_navigation_bar.dart';
import '../widgets/sponsors_speakers_tab_bar.dart';

const kMainAppBarHeight = Size.fromHeight(90);

class AppWrapper extends ConsumerStatefulWidget {
  const AppWrapper({super.key, this.initialTab = TabItemId.agenda});

  final TabItemId initialTab;

  @override
  ConsumerState<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends ConsumerState<AppWrapper>
    with SingleTickerProviderStateMixin {
  late final PageController pageController;
  late final TabController tabController;
  final List<TabItem> subTabs = appTabs.sublist(3, appTabs.length);

  @override
  void initState() {
    pageController = PageController(
      keepPage: true,
      initialPage: widget.initialTab.index,
    );

    tabController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref
          .watch(appCurrentTab.notifier)
          .update((state) => state = widget.initialTab.index);
    });

    super.initState();
  }

  void onTabSelected(index) {
    GoRouter.of(context).goNamed(
      RouteNames.home,
      pathParameters: {'tab': appTabs[index].id.name},
    );

    ref.watch(appCurrentTab.notifier).update((state) => state = index);

    if (index > 2) {
      updateSubTab(index - 3);
    }
  }

  void updateSubTab(index) {
    tabController.animateTo(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(appCurrentTab, ((previous, next) {
      pageController.jumpToPage(next);
    }));

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: ref.watch(appCurrentTab) == 2
          ? null
          : PreferredSize(
              preferredSize: kMainAppBarHeight,
              child: ref.watch(appCurrentTab) == 2
                  ? SizedBox.fromSize(
                      size: kMainAppBarHeight,
                    )
                  : const MainAppBar(),
            ),
      drawer: MainAppDrawer(itemChanged: (item) {
        if (item.id == DrawerItemId.sponsors) {
          updateSubTab(0);
        }
      }),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          ref.watch(appCurrentTab.notifier).update((state) => state = index);
        },
        children: appTabs.map((tab) {
          if (tab.id.index <= 2) {
            return tab.view;
          } else {
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: SponsorsSpeakersTabBar(
                    tabs: subTabs,
                    tabController: tabController,
                    onTap: (index) => onTabSelected(index + 3),
                  ),
                )
              ],
              body: tab.view,
            );
          }
        }).toList(),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        tabs: appTabs,
        selectedTab: ref.watch(appCurrentTab),
        onTabSelected: onTabSelected,
      ),
    );
  }
}
