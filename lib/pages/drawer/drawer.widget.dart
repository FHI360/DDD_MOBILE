import 'package:DDD/flutter_flow/flutter_flow_theme.dart';
import 'package:DDD/flutter_flow/flutter_flow_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            Text(FFAppState().name),
            Text(
              FFAppState().displayDame,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                    fontSize: 13,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText1Family),
                  ),
            )
          ],
        )),
      ),
      children: [
        MLMenuItem(
            leading: Icon(
              Icons.person_2,
            ),
            content: Text('PAGES.DRAWER.PATIENTS'.tr()),
            subMenuItems: [
              MLSubmenu(
                  onClick: () {
                    context.pushNamed('patientList');
                  },
                  submenuContent: Text('PAGES.DRAWER.PATIENTS_SEARCH'.tr())),
              if (!FFAppState().outlet)
                MLSubmenu(
                    onClick: () {
                      context.pushNamed('patientEdit');
                    },
                    submenuContent: Text('PAGES.DRAWER.PATIENTS_NEW'.tr())),
            ],
            onClick: () {}),
        MLMenuItem(
          leading: Icon(Icons.report_sharp),
          content: Text('PAGES.DRAWER.REPORTS'.tr()),
          onClick: () {
            context.pushNamed('reportList');
          },
        ),
        MLMenuItem(
          leading: Icon(Icons.sync),
          content: Text('PAGES.DRAWER.SYNCHRONIZATION'.tr()),
          onClick: () {
            context.pushNamed('synchronization');
          },
        ),
        if (FFAppState().admin)
          MLMenuItem(
            leading: Icon(Icons.settings),
            content: Text('PAGES.DRAWER.PREFERENCES'.tr()),
            onClick: () {
              context.pushNamed('preferences');
            },
          ),
        MLMenuItem(
          leading: Icon(Icons.exit_to_app),
          content: Text('PAGES.DRAWER.SIGN_OUT'.tr()),
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
          onClick: () {},
        ),
      ],
    );
  }
}
