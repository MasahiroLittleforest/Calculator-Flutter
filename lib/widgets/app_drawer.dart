import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import './neumorphic_container.dart';

class AppDrawer extends StatelessWidget {
  void _launchUrl() async {
    const String url = 'https://neumorphic-calculator.web.app';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 60),
            ListTile(
              title: NeumorphicContainer(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Licenses',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.blueGrey[700],
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                showLicensePage(context: context);
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: NeumorphicContainer(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Privacy policy',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.blueGrey[700],
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () async {
                _launchUrl();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
