import 'package:flutter/material.dart';
import 'package:todoapp/Themes/Dark_theme.dart';
import 'package:todoapp/Themes/LightTheme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = LightTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData newThemeData) {
    _themeData = newThemeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == LightTheme) {
      _themeData = Darktheme;
    } else {
      _themeData = LightTheme;
    }
    notifyListeners();
  }

}
