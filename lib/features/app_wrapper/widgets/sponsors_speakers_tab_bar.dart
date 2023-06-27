import 'package:flutter/material.dart';

import '../../../core/src/models/tab_item.dart';

class SponsorsSpeakersTabBar extends StatelessWidget {
  const SponsorsSpeakersTabBar({
    super.key,
    required this.tabs,
    required this.tabController,
    this.onTap,
  });

  final List<TabItem> tabs;
  final TabController tabController;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Theme.of(context).brightness == Brightness.light
            ? Border.all(color: Colors.grey[200]!, width: .5)
            : null,
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).brightness == Brightness.light
            ? null
            : Theme.of(context).cardColor.withOpacity(0.06),
      ),
      child: TabBar(
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        controller: tabController,
        enableFeedback: true,
        splashBorderRadius: BorderRadius.circular(15),
        indicator: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Theme.of(context).colorScheme.secondary,
        onTap: onTap,
        tabs: tabs
            .map(
              (tab) => Tab(text: tab.id.name),
            )
            .toList(),
      ),
    );
  }
}
