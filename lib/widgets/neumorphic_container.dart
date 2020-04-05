import 'package:flutter/material.dart';

class NeumorphicContainer extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final double bevel;
  final Offset offset;
  final Color color;
  final Color boxShadowColor;
  final double radius;
  final Widget child;

  NeumorphicContainer({
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(10.0),
    this.bevel = 10.0,
    this.color,
    this.boxShadowColor,
    this.radius = 10.0,
    this.child,
  }) : this.offset = Offset(bevel / 3, bevel / 3);

  @override
  Widget build(BuildContext context) {
    final Color _color =
        color == null ? Theme.of(context).backgroundColor : color;
    final Color _boxShadowColor =
        boxShadowColor == null ? Colors.blueGrey[100] : boxShadowColor;
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            offset: offset,
            color: _boxShadowColor,
            blurRadius: bevel / 3,
          ),
          BoxShadow(
            offset: -offset,
            color: Colors.white,
            blurRadius: bevel / 3,
          ),
        ],
      ),
      child: child,
    );
  }
}
