import 'package:flutter/cupertino.dart';

import '../utils/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = 'en';

  AppLanguageProvider() {
    loadSavedLanguage();
  }

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) return;

    appLanguage = newLanguage;
    SharedPrefs.saveLanguage(newLanguage);
    notifyListeners();
  }

  Future<void> loadSavedLanguage() async {
    final savedLang = await SharedPrefs.getLanguage();
    if (savedLang != null) {
      appLanguage = savedLang;
      notifyListeners();
    }
  }
}