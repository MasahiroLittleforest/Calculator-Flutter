import 'package:flutter/material.dart';

class NeumorphicAnimatedContainer extends StatefulWidget {
  NeumorphicAnimatedContainer({
    this.duration = const Duration(milliseconds: 20),
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(10),
    this.bevel = 10.0,
    this.color,
    this.radius = 10.0,
    this.child,
    this.isPressed,
    this.isLongPressed,
    this.buttonText,
  }) : offset = Offset(bevel / 2, bevel / 2);

  final Duration duration;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final double bevel;
  final Offset offset;
  final Color color;
  final double radius;
  final Widget child;
  final bool isPressed;
  final bool isLongPressed;
  final String buttonText;

  @override
  _NeumorphicAnimatedContainerState createState() =>
      _NeumorphicAnimatedContainerState();
}

class _NeumorphicAnimatedContainerState
    extends State<NeumorphicAnimatedContainer> {
  List<BoxShadow> getBoxShadows({@required bool isPressed}) {
    if (isPressed) {
      return null;
    }
    final List<BoxShadow> lightThemeBoxShadows = [
      BoxShadow(
        offset: -widget.offset,
        color: Colors.white,
        blurRadius: widget.bevel,
      ),
      BoxShadow(
        offset: widget.offset,
        color: Colors.blueGrey[300],
        blurRadius: widget.bevel,
      ),
    ];
    final List<BoxShadow> darkThemeBoxShadows = [
      BoxShadow(
        offset: -widget.offset,
        color: Colors.grey[850],
        blurRadius: widget.bevel,
      ),
      BoxShadow(
        offset: widget.offset,
        color: Colors.black,
        blurRadius: widget.bevel,
      ),
    ];
    final Brightness _brightness = Theme.of(context).brightness;
    if (_brightness == Brightness.light) {
      return lightThemeBoxShadows;
    } else {
      return darkThemeBoxShadows;
    }
  }

  final List<Color> _accentGradientColors = [
    Colors.tealAccent[700],
    Colors.tealAccent[400],
    Colors.tealAccent,
  ];
  final List<Color> _lightGradientColors = [
    Colors.blueGrey[200],
    Colors.blueGrey[100],
    Colors.blueGrey[50],
  ];
  final List<Color> _darkGradientColors = [
    Colors.black,
    Colors.grey[900],
    Colors.grey[850],
  ];

  LinearGradient _getGradient({
    @required bool isPressed,
    @required bool isLongPressed,
    @required String buttonText,
  }) {
    final List<double> _stops = [
      0.0,
      0.5,
      1.0,
    ];
    if (isLongPressed && buttonText == 'DEL') {
      return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: _stops,
        colors: _accentGradientColors,
      );
    } else if (isPressed) {
      return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: _stops,
        colors: Theme.of(context).brightness == Brightness.light
            ? _lightGradientColors
            : _darkGradientColors,
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color _color = widget.color ?? Theme.of(context).backgroundColor;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 20),
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: _color,
        gradient: _getGradient(
          isPressed: widget.isPressed,
          isLongPressed: widget.isLongPressed,
          buttonText: widget.buttonText,
        ),
        borderRadius: BorderRadius.circular(widget.radius),
        boxShadow: getBoxShadows(isPressed: widget.isPressed),
      ),
      child: widget.child,
    );
  }
}
