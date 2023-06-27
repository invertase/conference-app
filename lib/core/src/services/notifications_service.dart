import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../models/notification.dart';
import 'messaging_service.dart';

typedef NotificationCallback = void Function(Notification notification);

class NotificationsService {
  NotificationsService(
    this.localNotifications,
    this.firestore,
    this.messaging,
  );

  FlutterLocalNotificationsPlugin localNotifications;
  FirebaseFirestore firestore;
  FirebaseMessaging messaging;

  Future<void> setHandlers(
      {required NotificationCallback onMessageReceived}) async {
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    // Handle terminated messages.
    // Delay is needed since this handler is called early after GoRouter is attached to the context.
    Future.delayed(const Duration(seconds: 1)).then((_) async {
      final terminatedMessage = await messaging.getInitialMessage();
      log('${terminatedMessage?.toMap()}');
      if (terminatedMessage != null) {
        await _processMessage(
          message: terminatedMessage.toMap(),
          onMessageReceived: onMessageReceived,
        );
      }
    });

    // Handle foreground messages.
    FirebaseMessaging.onMessage.listen((message) {
      handleBackgroundMessage(message);
      _processMessage(
        message: message.toMap(),
        onMessageReceived: onMessageReceived,
        isForground: true,
      );
    });

    // Handle background messages.
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _processMessage(
        message: message.toMap(),
        onMessageReceived: onMessageReceived,
      );
    });

    // Local notifications
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: _iOSonDidReceiveLocalNotification,
    );

    await localNotifications.initialize(
      InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      ),
      onDidReceiveNotificationResponse: (payload) => _onSelectNotification(
        payload: payload.payload,
        onMessageReceived: onMessageReceived,
      ),
    );
  }

  Future<void> _iOSonDidReceiveLocalNotification(
      id, title, body, payload) async {}

  static NotificationDetails _makeNotificationDetails(title, body) {
    var androidChannelSpecifics = const AndroidNotificationDetails(
      'CHANNEL_ID',
      'CHANNEL_NAME',
      category: AndroidNotificationCategory.call,
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      styleInformation: DefaultStyleInformation(true, true),
      timeoutAfter: 40 * 1000,
    );
    var iosChannelSpecifics = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      badgeNumber: 1,
    );
    return NotificationDetails(
        android: androidChannelSpecifics, iOS: iosChannelSpecifics);
  }

  Future<void> showLocalNotification(Notification message) async {
    final title = message.notification['title'];
    final body = message.notification['body'];

    await localNotifications.show(
      0,
      title,
      body,
      _makeNotificationDetails(title, body),
      payload: jsonEncode(message.data),
    );
  }

  Future<void> _onSelectNotification({
    String? payload,
    required NotificationCallback onMessageReceived,
  }) async {
    if (payload == null) {
      return;
    }
    _processMessage(
      message: jsonDecode(payload),
      onMessageReceived: onMessageReceived,
    );
  }

  Future<void> _processMessage({
    required Map message,
    required NotificationCallback onMessageReceived,
    bool isForground = false,
  }) async {
    final data = message['data'] ?? message;
    NotificationAction action;
    NotificationScreen screen;

    try {
      action = NotificationAction.values.byName(data['action']);
      screen = NotificationScreen.values.byName(data['screen']);
    } on ArgumentError {
      action = NotificationAction.unknown;
      screen = NotificationScreen.unknown;
    }

    final notification = Notification(
      notification: message['notification'] ?? {},
      data: data,
      action: action,
      screen: screen,
      isForground: isForground,
    );

    onMessageReceived.call(notification);
  }
}
