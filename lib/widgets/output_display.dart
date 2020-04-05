import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/output_provider.dart';
import './neumorphic_emboss_container.dart';

class OutputDisplay extends StatefulWidget {
  final double height;
  final Color color;

  OutputDisplay({
    this.height = 120.0,
    this.color,
  });

  @override
  _OutputDisplayState createState() => _OutputDisplayState();
}

class _OutputDisplayState extends State<OutputDisplay>
    with SingleTickerProviderStateMixin {
  double _getContainerWidth() {
    final double _displayWidth = MediaQuery.of(context).size.width;
    final double _displayHeight = MediaQuery.of(context).size.height;
    double _buttonSize;
    final double _buttonHorizontalPadding = 20;
    double width;
    if (_displayHeight / _displayWidth >= 16 / 10) {
      _buttonSize = _displayWidth / 4.4;
    } else {
      _buttonSize = _displayWidth / 5.5;
    }
    width = _buttonSize * 4 - _buttonHorizontalPadding;
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
        color: Colors.blueGrey[700],
      ),
    );
  }

  Widget _buildResultText({@required String resultText}) {
    return Text(
      resultText,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.07,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color _color =
        widget.color == null ? Colors.blueGrey[100] : widget.color;
    return Consumer<Output>(
      builder: (BuildContext context, Output output, _) {
        return NeumorphicEmbossContainer(
          width: _getContainerWidth(),
          height: _getContainerHeight(),
          color: _color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: _buildEquationText(
                    equationText: output.equationText,
                  ),
                ),
                SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: _buildResultText(resultText: output.resultText),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
