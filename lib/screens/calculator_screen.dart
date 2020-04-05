import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/app_drawer.dart';
import '../widgets/buttons.dart';
import '../widgets/output_display.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildOutputDisplay() {
    final double _displayAspectRatio = MediaQuery.of(context).size.aspectRatio;
    if (_displayAspectRatio >= 16 / 9 || _displayAspectRatio <= 9 / 16) {
      return OutputDisplay();
    } else {
      return Expanded(
        child: OutputDisplay(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.blueGrey[50],
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.blueGrey[50],
        drawer: AppDrawer(),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20.0),
                _buildOutputDisplay(),
                const SizedBox(height: 15.0),
                Buttons(),
                const SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
