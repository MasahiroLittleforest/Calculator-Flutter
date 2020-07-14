import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/output_provider.dart';
import './neumorphic_animated_container.dart';

class NeumorphicButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final int flex;
  final double bevel;
  final Offset blurOffset;
  final Color color;

  NeumorphicButton({
    this.width,
    this.height,
    @required this.text,
    this.flex = 1,
    this.bevel = 10,
    this.color,
  }) : this.blurOffset = Offset(bevel / 2, bevel / 2);

  @override
  _NeumorphicButtonState createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;
  bool _isLongPressed = false;
  Color _color;

  double _getButtonSize() {
    final double _displayWidth = MediaQuery.of(context).size.width;
    final double _displayHeight = MediaQuery.of(context).size.height;
    double buttonSize;
    if (_displayHeight / _displayWidth >= 16 / 10) {
      buttonSize = _displayWidth / 4.4;
    } else {
      buttonSize = _displayWidth / 5.5;
    }
    return buttonSize;
  }

  double _getTextSize({
    @required String buttonText,
    @required double buttonSize,
  }) {
    double textSize;
    if (buttonText == 'DEL') {
      textSize = buttonSize * 0.19;
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '÷' ||
        buttonText == '=' ||
        buttonText == '.') {
      textSize = buttonSize * 0.29;
    } else {
      textSize = buttonSize * 0.25;
    }
    return textSize;
  }

  @override
  void initState() {
    if (widget.color == null) {
      _color = Colors.blueGrey[50];
    } else {
      _color = widget.color;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _buttonSize = _getButtonSize();
    final double _buttonWidth =
        widget.text == '=' ? _buttonSize * 2 : _buttonSize;
    final double _buttonHeight = _buttonSize;
    return Consumer<Output>(
      builder: (BuildContext context, Output output, _) {
        return Container(
          width: _buttonWidth,
          height: _buttonHeight,
          padding: const EdgeInsets.all(10.0),
          child: Listener(
            onPointerDown: (event) async {
              HapticFeedback.lightImpact();
              setState(() {
                _isPressed = true;
              });
              print('onPointerDown');
            },
            onPointerUp: (event) {
              setState(() {
                _isPressed = false;
              });
              output.onTapped(buttonText: widget.text);
              print('onPointerUp');
            },
            child: GestureDetector(
              // onTapDown: (details) {
              //   print('Tap down');
              //   setState(() {
              //     _isPressed = true;
              //   });
              // },
              // onTapUp: (details) {
              //   print('Tap up');
              //   setState(() {
              //     _isPressed = false;
              //   });
              //   output.onTapped(buttonText: widget.text);
              // },
              onLongPressStart: (details) {
                print('Long press start');
                setState(() {
                  _isPressed = true;
                  _isLongPressed = true;
                });
              },
              onLongPress: () async {
                print('Long press');
                if (widget.text == 'DEL') {
                  HapticFeedback.heavyImpact();
                  output.clear();
                }
              },
              onLongPressEnd: (details) {
                print('Long press end');
                setState(() {
                  _isPressed = false;
                  _isLongPressed = false;
                });
                // if (widget.text != 'DEL') {
                //   output.onTapped(buttonText: widget.text);
                // }
              },
              child: NeumorphicAnimatedContainer(
                buttonText: widget.text,
                width: _buttonWidth,
                height: _buttonHeight,
                color: _color,
                child: Container(
                  height: widget.height,
                  child: Center(
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: _getTextSize(
                          buttonText: widget.text,
                          buttonSize: _buttonSize,
                        ),
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[700],
                      ),
                    ),
                  ),
                ),
                isPressed: _isPressed,
                isLongPressed: _isLongPressed,
              ),
            ),
          ),
        );
      },
    );
  }
}
