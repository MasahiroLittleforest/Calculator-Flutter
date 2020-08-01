import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_preferences_keys.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider({
    @required this.sharedPreferences,
    @required BuildContext context,
  }) {
    this.useDeviceTheme =
        sharedPreferences.getBool(SharedPreferencesKeys.useDeviceTheme) ?? true;
    this.isDarkTheme =
        sharedPreferences.getBool(SharedPreferencesKeys.isDarkTheme) ?? false;
  }

  final SharedPreferences sharedPreferences;
  bool _isDarkTheme;
  bool _useDeviceTheme;

  bool get isDarkTheme => _isDarkTheme;
  bool get useDeviceTheme => _useDeviceTheme;

  ThemeData get currentThemeData =>
      _isDarkTheme ? darkThemeData : lightThemeData;

  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    notifyListeners();
    saveTheme(isDarkTheme: value);
    print('Is dark theme: $isDarkTheme');
    print('Use device theme: $useDeviceTheme');
  }

  set useDeviceTheme(bool value) {
    _useDeviceTheme = value;
    notifyListeners();
    (() async {
      sharedPreferences.setBool(
        SharedPreferencesKeys.useDeviceTheme,
        useDeviceTheme,
      );
    })();
    print('Is dark theme: $isDarkTheme');
    print('Use device theme: $useDeviceTheme');
  }

  Future<void> saveTheme({@required bool isDarkTheme}) async {
    sharedPreferences.setBool(SharedPreferencesKeys.isDarkTheme, isDarkTheme);
  }

  static final ThemeData lightThemeData = ThemeData(
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.blueGrey[50],
    backgroundColor: Colors.blueGrey[50],
    accentColor: Colors.blueGrey[700],
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
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

  final SystemUiOverlayStyle systemUiOverlayStyleForLight =
      SystemUiOverlayStyle(
    // Only Android && M+
    statusBarIconBrightness: Brightness.dark,
    // Only Android && O+
    systemNavigationBarColor: lightThemeData.scaffoldBackgroundColor,
    // Only Android && P+
    systemNavigationBarDividerColor: lightThemeData.accentColor,
    // Only Android && O+
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  final SystemUiOverlayStyle systemUiOverlayStyleForDark =
      SystemUiOverlayStyle.light.copyWith(
    // Only Android && M+
    statusBarIconBrightness: Brightness.light,
    // Only Android && O+
    systemNavigationBarColor: darkThemeData.scaffoldBackgroundColor,
    // Only Android && P+
    systemNavigationBarDividerColor: darkThemeData.accentColor,
    // Only Android && O+
    systemNavigationBarIconBrightness: Brightness.light,
  );

  SystemUiOverlayStyle get systemUiOverlayStyle =>
      _isDarkTheme ? systemUiOverlayStyleForDark : systemUiOverlayStyleForLight;
}
