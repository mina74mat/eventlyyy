import 'package:flutter/material.dart';
import '../utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  AppThemeProvider() {
    loadSavedTheme();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) return;

    appTheme = newTheme;
    SharedPrefs.saveTheme(newTheme == ThemeMode.dark ? 'dark' : 'light');
    notifyListeners();
  }

  Future<void> loadSavedTheme() async {
    final savedTheme = await SharedPrefs.getTheme();
    if (savedTheme == 'dark') {
      appTheme = ThemeMode.dark;
    } else {
      appTheme = ThemeMode.light;
    }
    notifyListeners();
  }

  bool isDarkMode() => appTheme == ThemeMode.dark;
}