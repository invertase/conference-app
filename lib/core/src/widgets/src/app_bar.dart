import 'package:flutter/material.dart';

import '../../router/app_router_extension.dart';
import 'app_buttons.dart';

class ConferenceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ConferenceAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: AppAdaptiveIconButton(
                onPressed: context.pop,
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
