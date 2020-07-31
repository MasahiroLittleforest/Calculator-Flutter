import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Theme',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2.color,
              ),
            ),
          ),
          SwitchListTile(
            title: const Text('Dark theme'),
            value: _themeProvider.isDarkTheme,
            onChanged: _themeProvider.useDeviceTheme
                ? null
                : (bool newVal) {
                    _themeProvider.isDarkTheme = newVal;
                  },
          ),
          SwitchListTile(
            title: const Text('Use device theme'),
            value: _themeProvider.useDeviceTheme,
            onChanged: (bool newVal) {
              _themeProvider.useDeviceTheme = newVal;
              if (_themeProvider.useDeviceTheme) {
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
