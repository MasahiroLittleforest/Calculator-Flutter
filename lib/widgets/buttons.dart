import 'package:flutter/material.dart';

import './neumorphic_button.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            NeumorphicButton(
              text: 'DEL',
            ),
            NeumorphicButton(
              text: '(',
            ),
            NeumorphicButton(
              text: ')',
            ),
            NeumorphicButton(text: '÷'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            NeumorphicButton(text: '7'),
            NeumorphicButton(text: '8'),
            NeumorphicButton(text: '9'),
            NeumorphicButton(text: '×'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            NeumorphicButton(text: '4'),
            NeumorphicButton(text: '5'),
            NeumorphicButton(text: '6'),
            NeumorphicButton(text: '-'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            NeumorphicButton(text: '1'),
            NeumorphicButton(text: '2'),
            NeumorphicButton(text: '3'),
            NeumorphicButton(text: '+'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            NeumorphicButton(text: '.'),
            NeumorphicButton(text: '0'),
            NeumorphicButton(text: '=', flex: 2),
          ],
        ),
      ],
    );
  }
}
