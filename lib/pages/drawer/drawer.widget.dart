import 'package:DDD/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class DDDDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiLevelDrawer(
      header: Container(
        height: size.height * 0.25,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(),
            SizedBox(
              height: 10,
            ),
            Text(FFAppState().name)
          ],
        )),
      ),
      children: [
        MLMenuItem(
            leading: Icon(
              Icons.person_2,
            ),
            content: const Text('Patients'),
            subMenuItems: [
              MLSubmenu(
                  onClick: () {
                    context.pushNamed('patientList');
                  },
                  submenuContent: Text("Search")),
              if (!FFAppState().outlet)
                MLSubmenu(
                    onClick: () {
                      context.pushNamed('patientEdit');
                    },
                    submenuContent: Text('New')),
            ],
            onClick: () {}),
        MLMenuItem(
          leading: Icon(Icons.report_sharp),
          content: Text("Reports"),
          onClick: () {
            context.pushNamed('reportList');
          },
        ),
        MLMenuItem(
          leading: Icon(Icons.sync),
          content: Text('Synchronization'),
          onClick: () {
            context.pushNamed('synchronization');
          },
        ),
        if (FFAppState().admin)
          MLMenuItem(
            leading: Icon(Icons.settings),
            content: Text("Preferences"),
            onClick: () {
              context.pushNamed('preferences');
            },
          ),
        MLMenuItem(
          leading: Icon(Icons.exit_to_app),
          content: Text('Sign out'),
          onClick: () {
            FFAppState().refreshToken = '';
            FFAppState().accessToken = '';
            FFAppState().activationCode = '';
            FFAppState().name = '';
            context.pushNamed('loginPage');
          },
        ),
        MLMenuItem(
          content: Text(''),
          onClick: () {
          },
        ),
      ],
    );
  }
}
