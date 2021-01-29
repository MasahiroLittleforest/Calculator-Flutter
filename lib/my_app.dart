import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './main.dart';
import './models/theme_state/theme_state.dart';
import './providers/theme_provider.dart';
import './screens/calculator_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final WidgetsBinding _widgetsBinding = WidgetsBinding.instance;
  Brightness _deviceBrightness;

  @override
  void initState() {
    super.initState();
    _widgetsBinding.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    final ThemeProvider _themeProvider = context.read(themeProvider);
    final ThemeState _themeState = context.read(themeProvider.state);
    setState(() {
      _deviceBrightness = _widgetsBinding.window.platformBrightness;
    });
    if (_themeState.usesDeviceTheme) {
      _themeProvider.useDarkTheme(value: _deviceBrightness == Brightness.dark);
    }
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    _widgetsBinding.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final ThemeProvider _themeProvider = watch(themeProvider);
        final ThemeState _themeState = watch(themeProvider.state);

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: _themeProvider.getSystemUiOverlayStyle(_deviceBrightness),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Neumorphic Calculator',
            themeMode: _themeState.themeMode,
            theme: ThemeProvider.lightThemeData,
            darkTheme: ThemeProvider.darkThemeData,
            home: CalculatorScreen(),
          ),
        );
      },
    );
  }
}
