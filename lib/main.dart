import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/output_state/output_state.dart';
import '../models/theme_state/theme_state.dart';
import './my_app.dart';
import './providers/output_provider.dart';
import './providers/theme_provider.dart';

final StateNotifierProvider<ThemeProvider, ThemeState> themeProvider =
    StateNotifierProvider((_) => ThemeProvider());

final StateNotifierProvider<OutputProvider, OutputState> outputProvider =
    StateNotifierProvider((_) => OutputProvider());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;
  FlutterError.onError = _crashlytics.recordFlutterError;
  await _crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);

  runZonedGuarded(
    () {
      FlutterError.onError = _crashlytics.recordFlutterError;

      runApp(
        const ProviderScope(
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
