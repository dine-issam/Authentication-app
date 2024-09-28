import 'package:auth_app/themes/dark_mode.dart';
import 'package:auth_app/themes/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier with WidgetsBindingObserver {
  ThemeData _themeData;

  ThemeProvider() : _themeData = lightMode {
    WidgetsBinding.instance.addObserver(this);
    _setTheme();
  }

  // get the current theme
  ThemeData get themeData => _themeData;

  // is it dark mode currently?
  bool get isDarkMode => _themeData == darkMode;

  // set the theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // toggle between dark & light mode
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  @override
  void didChangePlatformBrightness() {
    _setTheme();
  }

  void _setTheme() {
    // ignore: deprecated_member_use
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    themeData = (brightness == Brightness.dark) ? darkMode : lightMode;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
