import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './providers/theme_provider.dart';
import './providers/output_provider.dart';
import './screens/calculator_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  final SharedPreferences _sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return ThemeProvider(
          sharedPreferences: _sharedPreferences,
          context: context,
        );
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
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
    final ThemeProvider _themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    final Brightness _deviceBrightness =
        WidgetsBinding.instance.window.platformBrightness;
    if (_themeProvider.useDeviceTheme) {
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
    final ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _themeProvider.systemUiOverlayStyle,
      child: ChangeNotifierProvider<Output>(
        create: (BuildContext _) {
          return Output();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Neumorphic Calculator',
          theme: _themeProvider.currentThemeData,
          home: CalculatorScreen(),
        ),
      ),
    );
  }
}
