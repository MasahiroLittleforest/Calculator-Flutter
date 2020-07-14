import 'package:flutter/material.dart';

class NeumorphicAnimatedContainer extends StatefulWidget {
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

  NeumorphicAnimatedContainer({
    this.duration = const Duration(milliseconds: 20),
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(10.0),
    this.bevel = 10.0,
    this.color,
    this.radius = 10.0,
    this.child,
    this.isPressed,
    this.isLongPressed,
    this.buttonText,
  }) : this.offset = Offset(bevel / 2, bevel / 2);

  @override
  _NeumorphicAnimatedContainerState createState() =>
      _NeumorphicAnimatedContainerState();
}

class _NeumorphicAnimatedContainerState
    extends State<NeumorphicAnimatedContainer> {
  LinearGradient _getGradient({
    @required bool isPressed,
    @required bool isLongPressed,
    @required String buttonText,
  }) {
    if (isLongPressed && buttonText == 'DEL') {
      return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [
          -0.2,
          0.5,
          1.2,
        ],
        colors: [
          Colors.orange[400],
          Colors.amber,
          Colors.orange[100],
        ],
      );
    } else if (isPressed) {
      return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [
          -0.2,
          0.5,
          1.2,
        ],
        colors: [
          Colors.blueGrey[200],
          Colors.blueGrey[100],
          Colors.blueGrey[50],
        ],
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color _color =
        widget.color == null ? Theme.of(context).backgroundColor : widget.color;
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
        boxShadow: widget.isPressed
            ? null
            : [
                BoxShadow(
                  offset: widget.offset,
                  color: Colors.blueGrey[300],
                  blurRadius: widget.bevel,
                ),
                BoxShadow(
                  offset: -widget.offset,
                  color: Colors.white,
                  blurRadius: widget.bevel,
                ),
              ],
      ),
      child: widget.child,
    );
  }
}
