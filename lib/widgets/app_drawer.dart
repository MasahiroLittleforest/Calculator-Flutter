import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

import '../screens/settings_screen.dart';
import './neumorphic_container.dart';

class AppDrawer extends StatelessWidget {
  Future<void> _launchUrl() async {
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
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).textTheme.bodyText2?.color,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push<MaterialPageRoute>(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SettingsScreen();
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: NeumorphicContainer(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Licenses',
                      style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).textTheme.bodyText2?.color,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () async {
                final PackageInfo packageInfo =
                    await PackageInfo.fromPlatform();
                final String appName = packageInfo.appName;
                final String version = packageInfo.version;
                const double iconSize = 180;
                showLicensePage(
                  context: context,
                  applicationName: appName,
                  applicationVersion: version,
                  applicationIcon: Image.asset(
                    'assets/icon/icon_512_iphone.png',
                    width: iconSize,
                    height: iconSize,
                    fit: BoxFit.scaleDown,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: NeumorphicContainer(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Privacy policy',
                      style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).textTheme.bodyText2?.color,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () async {
                await _launchUrl();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
