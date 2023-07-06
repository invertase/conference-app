import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../configs/local_storage_keys.dart';
import 'local_storage_service.dart';

class MessagingService {
  const MessagingService([this._firebaseMessaging]);
  final FirebaseMessaging? _firebaseMessaging;

  Future<String?> get token async {
    await _firebaseMessaging?.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print(await _firebaseMessaging?.getToken());
    return _firebaseMessaging?.getToken();
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging?.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging?.unsubscribeFromTopic(topic);
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  final storage = LocalStorageService();
  await storage.init(LocalStorageKeys.hiveBoxName);
  // Get previous list.
  final List<String> notifications =
      (await storage.get(LocalStorageKeys.notifications)) ?? [];
  // Add the new list.
  final modified = message.toMap();
  modified['sentTime'] = DateTime.now().toIso8601String();

  await storage.set(
    LocalStorageKeys.notifications,
    notifications..add(json.encode(modified)),
  );
}
