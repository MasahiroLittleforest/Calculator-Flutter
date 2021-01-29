import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../models/output/output.dart';
import '../providers/theme_provider.dart';
import './neumorphic_emboss_container.dart';

class OutputDisplay extends StatefulWidget {
  const OutputDisplay({
    this.height = 120.0,
  });

  final double height;

  @override
  _OutputDisplayState createState() => _OutputDisplayState();
}

class _OutputDisplayState extends State<OutputDisplay>
    with SingleTickerProviderStateMixin {
  double _getContainerWidth() {
    final double _displayWidth = MediaQuery.of(context).size.width;
    final double _displayHeight = MediaQuery.of(context).size.height;
    double _buttonSize = 0;
    const double _buttonHorizontalPadding = 20;

    if (_displayHeight / _displayWidth >= 16 / 10) {
      _buttonSize = _displayWidth / 4.4;
    } else {
      _buttonSize = _displayWidth / 5.5;
    }

    final double width = _buttonSize * 4 - _buttonHorizontalPadding;
    return width;
  }

  double _getContainerHeight() {
    final double _displayWidth = MediaQuery.of(context).size.width;
    final double _displayHeight = MediaQuery.of(context).size.height;
    double height;
    if (_displayHeight / _displayWidth >= 16 / 10) {
      height = _displayWidth / 2.5;
    } else {
      height = _displayWidth / 3;
    }
    return height;
  }

  Widget _buildEquationText({@required String equationText}) {
    return Text(
      equationText,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.09,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildResultText({@required String resultText}) {
    return Text(
      resultText,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.07,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).textTheme.headline1.color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final ThemeProvider _themeProvider = watch(themeProvider);
        final Color _color = _themeProvider.getThemeBrightness(
                    WidgetsBinding.instance.window.platformBrightness) ==
                Brightness.dark
            ? Colors.grey[850]
            : Colors.blueGrey[100];
        final Output _output = watch(outputProvider.state);
        return NeumorphicEmbossContainer(
          width: _getContainerWidth(),
          height: _getContainerHeight(),
          color: _color,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: _buildEquationText(
                    equationText: _output.equationText,
                  ),
                ),
                SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: _buildResultText(resultText: _output.resultText),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
