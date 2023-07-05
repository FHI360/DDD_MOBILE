import 'package:DDD/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class DDDDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xccdf6f3e),
            ),
            child: Text('Drawer Header 1'),
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
        ],
      ),
    );
  }
}
