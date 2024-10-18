import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  late SharedPreferences locale;

  Future<void> initialzation() async {
    locale = await SharedPreferences.getInstance();
    if (locale.getString("lang") == null) {
      await locale.setString("lang", 'ar');
    }
  }

  String gatLang() {
    return locale.getString("lang") ?? "ar";
  }

  void changeLocale(String lang) async {
    locale.setString("lang", lang);
    notifyListeners();
  }
}
