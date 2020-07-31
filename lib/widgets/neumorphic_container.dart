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

  List<BoxShadow> getBoxShadows({@required BuildContext context}) {
    final Brightness _brightness = Theme.of(context).brightness;
    if (_brightness == Brightness.light) {
      return [
        BoxShadow(
          offset: -offset,
          color: Colors.white,
          blurRadius: bevel / 3,
        ),
        BoxShadow(
          offset: offset,
          color: Colors.blueGrey[100],
          blurRadius: bevel / 3,
        ),
      ];
    } else {
      return [
        BoxShadow(
          offset: -offset,
          color: Colors.grey[850],
          blurRadius: bevel / 3,
        ),
        BoxShadow(
          offset: offset,
          color: Colors.black,
          blurRadius: bevel / 3,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: getBoxShadows(context: context),
      ),
      child: child,
    );
  }
}
