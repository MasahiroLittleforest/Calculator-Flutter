import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_preferences_keys.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider({
    @required this.sharedPreferences,
    @required BuildContext context,
  }) {
    this.usesDeviceTheme =
        sharedPreferences.getBool(SharedPreferencesKeys.usesDeviceTheme) ??
            true;
    this.isDarkTheme =
        sharedPreferences.getBool(SharedPreferencesKeys.isDarkTheme) ?? false;
  }

  final SharedPreferences sharedPreferences;
  bool _isDarkTheme;
  bool _useDeviceTheme;

  bool get isDarkTheme => _isDarkTheme;
  bool get usesDeviceTheme => _useDeviceTheme;

  ThemeMode get themeMode {
    if (this.usesDeviceTheme) {
      return ThemeMode.system;
    }
    if (this.isDarkTheme) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    notifyListeners();
    (() async {
      sharedPreferences.setBool(
        SharedPreferencesKeys.isDarkTheme,
        isDarkTheme,
      );
    })();
    print('Is dark theme: $isDarkTheme');
    print('Use device theme: $usesDeviceTheme');
  }

  set usesDeviceTheme(bool value) {
    _useDeviceTheme = value;
    notifyListeners();
    (() async {
      sharedPreferences.setBool(
        SharedPreferencesKeys.usesDeviceTheme,
        usesDeviceTheme,
      );
    })();
    print('Is dark theme: $isDarkTheme');
    print('Use device theme: $usesDeviceTheme');
  }

  static final ThemeData lightThemeData = ThemeData(
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.blueGrey[50],
    backgroundColor: Colors.blueGrey[50],
    accentColor: Colors.blueGrey[700],
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.blueGrey[700],
      ),
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.blueGrey[700],
      ),
      headline1: TextStyle(
        color: Colors.blueGrey,
      ),
      subtitle1: TextStyle(
        color: Colors.blueGrey[800],
      ),
    ),
  );

  static final ThemeData darkThemeData = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.grey[900],
    backgroundColor: Colors.grey[900],
    accentColor: Colors.grey[400],
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: Colors.transparent,
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.grey[400],
      ),
      headline1: TextStyle(
        color: Colors.grey[600],
      ),
    ),
  );

  static final SystemUiOverlayStyle _systemUiOverlayStyleForLight =
      SystemUiOverlayStyle.dark.copyWith(
    // Only in iOS
    statusBarBrightness: Brightness.light,
    // Only Android && M+
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    // Only Android && O+
    systemNavigationBarColor: lightThemeData.scaffoldBackgroundColor,
    // Only Android && P+
    systemNavigationBarDividerColor: lightThemeData.accentColor,
    // Only Android && O+
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static final SystemUiOverlayStyle _systemUiOverlayStyleForDark =
      SystemUiOverlayStyle.light.copyWith(
    // Only in iOS
    statusBarBrightness: Brightness.dark,
    // Only Android && M+
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    // Only Android && O+
    systemNavigationBarColor: darkThemeData.scaffoldBackgroundColor,
    // Only Android && P+
    systemNavigationBarDividerColor: darkThemeData.accentColor,
    // Only Android && O+
    systemNavigationBarIconBrightness: Brightness.light,
  );

  SystemUiOverlayStyle get systemUiOverlayStyle => _isDarkTheme
      ? _systemUiOverlayStyleForDark
      : _systemUiOverlayStyleForLight;
}
