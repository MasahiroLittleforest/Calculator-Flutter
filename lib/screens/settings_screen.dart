import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../models/theme_state/theme_state.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final ThemeProvider _themeProvider = watch(themeProvider.notifier);
        final ThemeState _themeState = watch(themeProvider);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Theme',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText2?.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SwitchListTile(
                title: const Text('Dark theme'),
                value: _themeState.isDarkTheme,
                onChanged: _themeState.usesDeviceTheme
                    ? null
                    : (bool newVal) {
                        _themeProvider.useDarkTheme(value: newVal);
                      },
              ),
              SwitchListTile(
                title: const Text('Use device theme'),
                value: _themeState.usesDeviceTheme,
                onChanged: (bool newVal) {
                  _themeProvider.useDeviceTheme(value: newVal);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
