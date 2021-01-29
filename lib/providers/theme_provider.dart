import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/theme_state/theme_state.dart';
import '../utils/shared_preferences_keys.dart';

class ThemeProvider extends StateNotifier<ThemeState> {
  ThemeProvider() : super(const ThemeState()) {
    init();
  }

  SharedPreferences prefs;

  Future<void> init() async {
    prefs ??= await SharedPreferences.getInstance();

    final bool _usesDeviceTheme =
        prefs.getBool(SharedPreferencesKeys.usesDeviceTheme);
    final bool _isDarkTheme = prefs.getBool(SharedPreferencesKeys.isDarkTheme);

    state = state.copyWith(
      isDarkTheme: _isDarkTheme ?? true,
      usesDeviceTheme: _usesDeviceTheme ?? false,
    );
  }

  Future<void> useDarkTheme({@required bool value}) async {
    state = state.copyWith(isDarkTheme: value);

    prefs ??= await SharedPreferences.getInstance();
    await prefs.setBool(
      SharedPreferencesKeys.isDarkTheme,
      value,
    );
  }

  Future<void> useDeviceTheme({@required bool value}) async {
    state = state.copyWith(usesDeviceTheme: value);

    prefs ??= await SharedPreferences.getInstance();
    await prefs.setBool(
      SharedPreferencesKeys.usesDeviceTheme,
      value,
    );
  }

  Brightness getThemeBrightness(Brightness deviceBrightness) {
    if (state.usesDeviceTheme) {
      return deviceBrightness;
    } else {
      if (state.isDarkTheme) {
        return Brightness.dark;
      } else {
        return Brightness.light;
      }
    }
  }

  SystemUiOverlayStyle getSystemUiOverlayStyle(Brightness deviceBrightness) {
    switch (getThemeBrightness(deviceBrightness)) {
      case Brightness.light:
        return _systemUiOverlayStyleForLight;
      case Brightness.dark:
        return _systemUiOverlayStyleForDark;
      default:
        return _systemUiOverlayStyleForLight;
    }
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
      headline1: const TextStyle(
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
    appBarTheme: const AppBarTheme(
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
}
