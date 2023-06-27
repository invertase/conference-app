import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/src/models/tab_item.dart';
import 'main_bottom_navigation_bar_icon.dart';

const kBottomNavigationBarShape = 'assets/images/bottom_app_bar_shape.svg';
const kBottomNavigationBarBlur = 'assets/images/bottom_navigation_bar_blur.png';
const kBottomNavigationBarBlurSize = 80.0;

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
    required this.tabs,
    required this.selectedTab,
    this.onTabSelected,
  });

  final List<TabItem> tabs;

  final int selectedTab;
  final ValueChanged<int>? onTabSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: MediaQuery.of(context).viewPadding.bottom > 30 &&
          defaultTargetPlatform == TargetPlatform.android,
      child: SizedBox(
        height: kBottomNavigationBarBlurSize,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              clipBehavior: Clip.hardEdge,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor!,
                ),
                child: SvgPicture.asset(
                  kBottomNavigationBarShape,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context)
                            .bottomNavigationBarTheme
                            .backgroundColor ??
                        Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Image.asset(
              kBottomNavigationBarBlur,
              fit: BoxFit.fitWidth,
              height: 90,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (final tab in tabs)
                      MainBottomNavigatiopnBarIcon(
                        onPressed: () => onTabSelected?.call(tab.id.index),
                        icon: tab.icon,
                        color: tab.iconColor,
                        activeColor: tab.activeIconColor,
                        active: selectedTab == tabs.indexOf(tab),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
