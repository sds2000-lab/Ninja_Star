import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;

  ThemeData get currentTheme => _currentTheme;

  void changeTheme() {
    _currentTheme = AppThemeLight.instance.theme;
    notifyListeners();
  }
}