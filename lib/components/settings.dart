import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'widgets/languages_screen.dart';
import 'package:flutter_profile_mix/components/drawer.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),
        centerTitle: true,
        automaticallyImplyLeading : true,
        leading : IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerMenu()));
          },
        ),
      ),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('Common'),
          tiles: [
            SettingsTile(
              title: Text('Language'),
              //subtitle: 'English',
              leading: Icon(Icons.language),
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => LanguagesScreen(),
                ));
              },
            ),
            // CustomTile(
            //   child: Container(
            //     color: Color(0xFFEFEFF4),
            //     padding: EdgeInsetsDirectional.only(
            //       start: 14,
            //       top: 12,
            //       bottom: 30,
            //       end: 14,
            //     ),
            //     child: Text(
            //       'You can setup the language you want',
            //       style: TextStyle(
            //         color: Colors.grey.shade700,
            //         fontWeight: FontWeight.w400,
            //         fontSize: 13.5,
            //         letterSpacing: -0.5,
            //       ),
            //     ),
            //   ),
            // ),
            SettingsTile(
              title: Text('Environment'),
              //subtitle: 'Production',
              leading: Icon(Icons.cloud_queue),
            ),
          ],
        ),
        SettingsSection(
          title: Text('Account'),
          tiles: [
            SettingsTile(title: Text('Phone number'), leading: const Icon(Icons.phone)),
            SettingsTile(title: Text('Email'), leading: Icon(Icons.email)),
            SettingsTile(title: Text('Sign out'), leading: Icon(Icons.exit_to_app)),
          ],
        ),
        SettingsSection(
          title: Text('Security'),
          tiles: [
            SettingsTile.switchTile(
              title: Text('Lock app in background'),
              leading: Icon(Icons.phonelink_lock),
              //switchValue: lockInBackground,
              onToggle: (bool value) {
                setState(() {
                  lockInBackground = value;
                  notificationsEnabled = value;
                });
              }, initialValue: null,
            ),
            SettingsTile.switchTile(
              title: Text('Use fingerprint'),
              //subtitle: 'Allow application to access stored fingerprint IDs.',
              leading: Icon(Icons.fingerprint),
              onToggle: (bool value) {}, initialValue: null,
            ),
            SettingsTile.switchTile(
              title: Text('Change password'),
              leading: Icon(Icons.lock),
              onToggle: (bool value) {}, initialValue: null,
            ),
            SettingsTile.switchTile(
              title: Text('Enable Notifications'),
              enabled: notificationsEnabled,
              leading: Icon(Icons.notifications_active),
              onToggle: (value) {}, initialValue: null,
            ),
          ],
        ),
        SettingsSection(
          title: Text('Misc'),
          tiles: [
            SettingsTile(
                title: Text('Terms of Service'), leading: Icon(Icons.description)),
            SettingsTile(
                title: Text('Open source licenses'),
                leading: Icon(Icons.collections_bookmark)),
          ],
        ),
        // CustomSection(
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(top: 22, bottom: 8),
        //         child: Image.asset(
        //           'assets/settings.png',
        //           height: 50,
        //           width: 50,
        //           color: Color(0xFF777777),
        //         ),
        //       ),
        //       Text(
        //         'Version: 2.4.0 (287)',
        //         style: TextStyle(color: Color(0xFF777777)),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
