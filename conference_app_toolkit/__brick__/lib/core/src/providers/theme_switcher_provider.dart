import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeSwitcher = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});
