import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  @visibleForTesting
  late Box hiveBox;

  Future<void>? init(String name) async {
    await Hive.initFlutter();
    hiveBox = await Hive.openBox(name);
  }

  Future<void> closeBox() async {
    await hiveBox.close();
  }

  Future<void> remove(String key) async {
    hiveBox.delete(key);
  }

  dynamic get(String key) {
    return hiveBox.get(key);
  }

  dynamic getAll() {
    return hiveBox.values.toList();
  }

  bool has(String key) {
    return hiveBox.containsKey(key);
  }

  Future<void> set(String key, dynamic data) async {
    hiveBox.put(key, data);
  }

  Future<void> clear() async {
    await hiveBox.clear();
  }
}
