import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
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
                color: Theme.of(context).textTheme.bodyText2.color,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SwitchListTile(
            title: const Text('Dark theme'),
            value: _themeProvider.isDarkTheme,
            onChanged: _themeProvider.usesDeviceTheme
                ? null
                : (bool newVal) {
                    _themeProvider.isDarkTheme = newVal;
                  },
          ),
          SwitchListTile(
            title: const Text('Use device theme'),
            value: _themeProvider.usesDeviceTheme,
            onChanged: (bool newVal) {
              _themeProvider.usesDeviceTheme = newVal;
              if (_themeProvider.usesDeviceTheme) {
                _themeProvider.isDarkTheme =
                    MediaQuery.of(context).platformBrightness ==
                        Brightness.dark;
              }
            },
          ),
        ],
      ),
    );
  }
}
