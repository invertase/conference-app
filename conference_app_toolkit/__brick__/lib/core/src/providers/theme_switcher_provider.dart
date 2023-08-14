import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeSwitcher =
    StateNotifierProvider<ThemeSwitcherNotifier, ThemeMode>((ref) {
  return ThemeSwitcherNotifier();
});

class ThemeSwitcherNotifier extends StateNotifier<ThemeMode> {
  ThemeSwitcherNotifier() : super(ThemeMode.system);

  void switchTheme(ThemeMode mode) {
    state = mode;
  }
}
