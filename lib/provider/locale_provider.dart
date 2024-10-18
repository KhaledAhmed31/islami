import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  String locale = 'ar';

  void changeLocale(String locale) {
    this.locale = locale;
    notifyListeners();
  }
}
