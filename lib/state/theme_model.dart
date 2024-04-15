import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDark;

  ThemeModel({required bool isDark}) : _isDark = isDark;

  bool get isDark => _isDark;

  set isDark(bool value) {
    SharedPreferences.getInstance().then((prefs) {
      return prefs.setBool('isDarkMode', value).then((value) => value);
    });
    _isDark = value;
    notifyListeners();
  }
}