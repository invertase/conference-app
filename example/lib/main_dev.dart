import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'core/core.dart';
import 'firebase_options_dev.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  _useEmulator(useEmulator: true);

  final localStorageService = LocalStorageService();
  await localStorageService.init(LocalStorageKeys.hiveBoxName);
  final messaging = MessagingService(FirebaseMessaging.instance);
  await PackageInfo.fromPlatform();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  return runApp(
    ProviderScope(
      overrides: [
        localStorage.overrideWithValue(localStorageService),
        messagingService.overrideWithValue(messaging),
      ],
      child: const ConferenceApp(),
    ),
  );
}

_useEmulator({useEmulator = false}) {
  final firestore = FirebaseFirestore.instance;
  if (useEmulator) {
    firestore.useFirestoreEmulator('localhost', 8080);
  }
}
