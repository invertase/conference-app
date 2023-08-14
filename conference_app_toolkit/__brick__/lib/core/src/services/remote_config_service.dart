import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  const RemoteConfigService(this._remoteConfig);

  final FirebaseRemoteConfig _remoteConfig;

  Future<void> init() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(seconds: 1),
    ));

    _remoteConfig.setDefaults(<String, dynamic>{
      'activities_banner': 'assets/images/activities_banner.png',
      'show_activities': false,
    });
  }

  Future<String> getString(String key) async {
    final string = _remoteConfig.getString(key);
    await _remoteConfig.fetchAndActivate();

    return string;
  }

  Future<bool> getBool(String key) async {
    final value = _remoteConfig.getBool(key);
    await _remoteConfig.fetchAndActivate();
    return value;
  }
}
