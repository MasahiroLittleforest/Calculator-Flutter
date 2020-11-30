import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './providers/theme_provider.dart';
import './providers/output_provider.dart';
import './screens/calculator_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;
  FlutterError.onError = _crashlytics.recordFlutterError;
  await _crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);

  await runZonedGuarded(
    () async {
      FlutterError.onError = _crashlytics.recordFlutterError;
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
    },
    (error, stackTrace) {
      print('runZonedGuarded: Caught error in my root zone.');
      _crashlytics.recordError(error, stackTrace);
    },
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
          themeMode: _themeProvider.themeMode,
          theme: ThemeProvider.lightThemeData,
          darkTheme: ThemeProvider.darkThemeData,
          home: CalculatorScreen(),
        ),
      ),
    );
  }
}
