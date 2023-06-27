import 'package:flutter/material.dart';
import 'package:flutter_vikings/core/core.dart';

import '../models/drawer_item.dart';

class MainAppDrawerListItem extends StatelessWidget {
  const MainAppDrawerListItem({
    super.key,
    required this.item,
    this.extra,
    this.onPressed,
  });

  final DrawerItem item;
  final String? extra;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: AppAdaptiveTextButton(
        noPadding: true,
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(
              width: 28,
              height: 28,
              child: AppImageIcon(icon: item.icon),
            ),
            const Spacer(),
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (extra != null)
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        extra!,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white),
                      ),
                    )
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            )
          ],
        ),
      ),
    );
  }
}
