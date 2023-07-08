import 'package:conference_app/app.dart';
import 'package:conference_app/core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'core/routing/routing_tests.dart';

void main() {
  late LocalStorageService localStorageService;
  late MessagingService messaging;
  late ProviderScope mainApp;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }

    localStorageService = LocalStorageService();
    await localStorageService.init(LocalStorageKeys.hiveBoxName);
    messaging = MessagingService(FirebaseMessaging.instance);

    mainApp = ProviderScope(
      overrides: [
        localStorage.overrideWithValue(localStorageService),
        messagingService.overrideWithValue(messaging),
      ],
      child: const ConferenceApp(),
    );
  });

  testWidgets('Router navigation test', (tester) async {
    await tester.pumpWidget(mainApp);
    await routerTests(tester);
  });
}
