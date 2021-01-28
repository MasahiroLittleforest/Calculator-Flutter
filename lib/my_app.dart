import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './main.dart';
import './providers/theme_provider.dart';
import './screens/calculator_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    final ThemeProvider _themeProvider = context.read(themeProvider);
    final Brightness _deviceBrightness =
        WidgetsBinding.instance.window.platformBrightness;
    if (_themeProvider.usesDeviceTheme) {
      _themeProvider.isDarkTheme = _deviceBrightness == Brightness.dark;
    }
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final ThemeProvider _themeProvider = watch(themeProvider);
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: _themeProvider.systemUiOverlayStyle,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Neumorphic Calculator',
            themeMode: _themeProvider.themeMode,
            theme: ThemeProvider.lightThemeData,
            darkTheme: ThemeProvider.darkThemeData,
            home: CalculatorScreen(),
          ),
        );
      },
    );
  }
}
