import 'dart:convert' show utf8, json;

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vikings/core/core.dart';
import 'package:http/http.dart';

final activitiesProvider =
    FutureProvider.autoDispose<List<Activity>>((ref) async {
  final res = await get(
    Uri(
      host: 'fluttervikings.com',
      path: 'data/api/activity.json',
      scheme: 'https',
    ),
  );

  return json
      .decode(utf8.decode(res.body.runes.toList()))
      .map<Activity>((e) => Activity.fromJson(e))
      .toList()
      .cast<Activity>();
});

final remoteConfigService = Provider<RemoteConfigService>((ref) {
  return RemoteConfigService(FirebaseRemoteConfig.instance);
});

final activitiesBanner = FutureProvider.autoDispose<String>((ref) {
  return ref.watch(remoteConfigService).getString('activities_banner');
});
