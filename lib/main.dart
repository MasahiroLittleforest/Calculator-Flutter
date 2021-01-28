import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './my_app.dart';
import './providers/theme_provider.dart';
import './providers/output_provider.dart';

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
          child: const MyApp(),
        ),
      );
    },
    (error, stackTrace) {
      print('runZonedGuarded: Caught error in my root zone.');
      _crashlytics.recordError(error, stackTrace);
    },
  );
}
