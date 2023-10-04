import 'package:conference_app/core/core.dart' as core;
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});

  final core.Notification notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: core.AppRadius.kRadiusSmall,
        boxShadow: [core.AppShadows.primaryBlack],
        color: Theme.of(context).cardColor.withOpacity(
            Theme.of(context).brightness == Brightness.dark ? 0.05 : 1),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_rounded,
            color: Colors.greenAccent,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.data['title'],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  notification.data['body'],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
