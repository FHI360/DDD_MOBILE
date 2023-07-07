import 'package:DDD/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class DDDDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xFFF2A384),
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFFF2A384),
              ),
              accountName: Text(FFAppState().name),
              accountEmail: Text(''),
              currentAccountPicture: FlutterLogo(),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person_2,
            ),
            title: const Text('Patients'),
            onTap: () {
              context.pushNamed('patientList');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: const Text('Preferences'),
            onTap: () {
              context.pushNamed('preferences');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
            ),
            title: const Text('Sign out'),
            onTap: () {
              FFAppState().refreshToken = '';
              FFAppState().accessToken = '';
              FFAppState().activationCode = '';
              FFAppState().name = '';
              context.pushNamed('loginPage');
            },
          ),
        ],
      ),
    );
  }
}
