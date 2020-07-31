import 'package:flutter/material.dart';

class NeumorphicEmbossContainer extends StatelessWidget {
  final double width;
  final double height;
  final double bevel;
  final Color color;
  final double radius;
  final Widget child;

  NeumorphicEmbossContainer({
    this.width,
    this.height,
    this.bevel = 10.0,
    this.color,
    this.radius = 10.0,
    this.child,
  });

  List<BoxShadow> getBoxShadows({@required BuildContext context}) {
    final Brightness _brightness = Theme.of(context).brightness;
    final List<BoxShadow> lightThemeBoxShadows = [
      BoxShadow(
        offset: Offset(bevel / 4, bevel / 4),
        color: Colors.white,
        blurRadius: bevel / 4,
      ),
      BoxShadow(
        offset: Offset(-bevel / 4, -bevel / 4),
        color: Colors.blueGrey[300],
        blurRadius: bevel / 4,
      ),
    ];
    final List<BoxShadow> darkThemeBoxShadows = [
      BoxShadow(
        offset: Offset(bevel / 4, bevel / 4),
        color: Colors.grey[800],
        blurRadius: bevel / 4,
      ),
      BoxShadow(
        offset: Offset(-bevel / 4, -bevel / 4),
        color: Colors.black,
        blurRadius: bevel / 4,
      ),
    ];
    if (_brightness == Brightness.light) {
      return lightThemeBoxShadows;
    } else {
      return darkThemeBoxShadows;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: getBoxShadows(context: context),
      ),
      child: child,
    );
  }
}
