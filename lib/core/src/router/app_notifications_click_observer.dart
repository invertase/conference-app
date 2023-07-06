import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/notification.dart';
import '../models/session.dart';
import '../models/session_details.dart';
import '../services/notifications_service.dart';
import '../services/sessions_service.dart';
import '../services/speakers_service.dart';
import '../widgets/src/session_started_dialog.dart';
import 'app_router_extension.dart';

class NotificationClickCallback {
  final Function(Future<Session?> session, {bool dialog}) onSessionClick;
  final Function(String url) onUrlClick;

  NotificationClickCallback({
    required this.onSessionClick,
    required this.onUrlClick,
  });
}

/// Observe the changes in the router to handle the correct context for on-click
/// remote and local notifications.
class NotificationObserver extends NavigatorObserver {
  final NotificationsService notificationsService;
  final SessionsService sessionsService;
  final SpeakersService speakersService;

  NotificationObserver(
    this.notificationsService,
    this.sessionsService,
    this.speakersService,
  ) {
    notificationsService.setHandlers(onMessageReceived: (notification) {
      final callbacks = getNotificationsHandler(navigator?.context);
      final data = notification.data;

      if (data.containsKey('url') && !notification.isForground) {
        callbacks.onUrlClick(data['url']);
      }

      if (data.containsKey('sessionId')) {
        if (notification.action == NotificationAction.silent ||
            notification.action == NotificationAction.unknown) {
          return;
        }

        if (notification.action == NotificationAction.dialog) {
          if (!navigator!.context.inRoute(notification.screen.name) &&
              notification.isForground) {
            switch (notification.screen) {
              case NotificationScreen.session:
                callbacks.onSessionClick(
                  sessionsService.getSession(data['sessionId']),
                  dialog: true,
                );
                break;
              default:
                notificationsService.showLocalNotification(notification);
            }

            return;
          } else if (navigator!.context.inRoute(notification.screen.name)) {
            return;
          } else {
            switch (notification.screen) {
              case NotificationScreen.session:
                callbacks.onSessionClick(
                  sessionsService.getSession(data['sessionId']),
                  dialog: true,
                );
                break;
              default:
            }
          }
        }

        if (notification.action == NotificationAction.navigate &&
            navigator != null) {
          if (!navigator!.context.inRoute(notification.screen.name) &&
              notification.isForground) {
            switch (notification.screen) {
              case NotificationScreen.session:
                callbacks.onSessionClick(
                  sessionsService.getSession(data['sessionId']),
                );
                break;
              default:
            }
            return;
          } else if (navigator!.context.inRoute(notification.screen.name)) {
            return;
          } else {
            switch (notification.screen) {
              case NotificationScreen.session:
                callbacks.onSessionClick(
                  sessionsService.getSession(data['sessionId']),
                );
                break;
              default:
            }
          }
        }
      }
    });
  }

  /// Set a handler for the cases when the user clicks on a notification.
  NotificationClickCallback getNotificationsHandler(BuildContext? context) {
    return NotificationClickCallback(
      onSessionClick: (Future<Session?> session, {bool dialog = false}) {
        if (context != null) {
          session.then((session) {
            if (session != null) {
              speakersService
                  .getSpeakersById(session.speakers.cast())
                  .then((speakers) {
                if (dialog) {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black26,
                    builder: (context) => SessionStartedDialog(
                      session: session,
                      speakers: speakers,
                    ),
                  );
                } else {
                  context.pushSession(
                    SessionDetails(session: session, speakers: speakers),
                  );
                }
              });
            }
          });
        }
      },
      onUrlClick: (String url) async {
        if (context != null && await canLaunchUrlString(url)) {
          try {
            await launchUrlString(url, mode: LaunchMode.externalApplication);
          } catch (e) {
            log('Error launching url: $url', error: e);
          }
        }
      },
    );
  }
}
