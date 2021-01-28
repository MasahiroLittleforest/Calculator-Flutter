import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(true) bool isDarkTheme,
    @Default(false) bool usesDeviceTheme,
  }) = _ThemeState;

  const ThemeState._();

  ThemeMode get themeMode {
    if (usesDeviceTheme) {
      return ThemeMode.system;
    }
    if (isDarkTheme) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
