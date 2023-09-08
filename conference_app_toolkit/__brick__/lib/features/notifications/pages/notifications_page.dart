import 'dart:convert';

import 'package:conference_app/core/core.dart' as core;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/notification_item.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  List<core.Notification> notifications = [];

  void getNotifications() {
    notifications =
        (ref.read(core.localStorage).get(core.LocalStorageKeys.notifications) ??
                [])
            .map((i) => core.Notification.fromJson(json.decode(i)))
            .toList()
            .cast<core.Notification>();

    final now = DateTime.now();

    notifications.sort((a, b) => b.sentTime?.compareTo(a.sentTime ?? now) ?? 0);
  }

  @override
  void initState() {
    getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).textTheme.bodyMedium?.color,
        titleTextStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold),
        centerTitle: true,
        leading: Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: core.AppAdaptiveIconButton(
              onPressed: context.pop,
              child: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
        ),
        title: const Text('Notifications'),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: core.AppAdaptiveIconButton(
                    child: const Icon(Icons.delete_sweep_rounded),
                    onPressed: () {
                      setState(() {
                        ref
                            .watch(core.localStorage)
                            .remove(core.LocalStorageKeys.notifications);

                        getNotifications();
                      });
                    }),
              ),
            ),
          )
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: notifications.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(30.0),
                child: Center(
                  child: Text(
                    'You don\'t have any notifications yet.',
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                padding: EdgeInsets.fromLTRB(
                    20, 20, 20, MediaQuery.of(context).padding.bottom + 20),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationItem(
                    notification: notifications[index],
                  );
                },
              ),
      ),
    );
  }
}
