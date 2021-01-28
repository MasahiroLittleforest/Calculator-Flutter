import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './providers/theme_provider.dart';
import './providers/output_provider.dart';
import './screens/calculator_screen.dart';

final ChangeNotifierProvider<ThemeProvider> themeProvider =
    ChangeNotifierProvider((_) => ThemeProvider());

final ChangeNotifierProvider<Output> outputProvider =
    ChangeNotifierProvider((_) => Output());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //   ),
  // );

  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;
  FlutterError.onError = _crashlytics.recordFlutterError;
  await _crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);

  runZonedGuarded(
    () {
      FlutterError.onError = _crashlytics.recordFlutterError;

      runApp(
        ProviderScope(
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
