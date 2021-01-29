import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/buttons.dart';
import '../widgets/output_display.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildOutputDisplay() {
    final double _displayAspectRatio = MediaQuery.of(context).size.aspectRatio;
    if (_displayAspectRatio >= 16 / 9 || _displayAspectRatio <= 9 / 16) {
      return const OutputDisplay();
    } else {
      return const Expanded(
        child: OutputDisplay(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              _buildOutputDisplay(),
              const SizedBox(height: 15),
              Buttons(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
