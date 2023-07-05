import 'package:DDD/app_state.dart';
import 'package:DDD/backend/http/auth_api_provider.dart';
import 'package:DDD/flutter_flow/flutter_flow_model.dart';
import 'package:DDD/flutter_flow/flutter_flow_theme.dart';
import 'package:DDD/flutter_flow/flutter_flow_widgets.dart';
import 'package:DDD/flutter_flow/instant_timer.dart';
import 'package:DDD/flutter_flow/nav/nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page_model.dart';

export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.emailAddressLoginController ??= TextEditingController();
    _model.passwordLoginController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          if (FFAppState().refreshToken != '') {
            context.pushNamed('homePage');
          }
        },
        startImmediately: true,
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 1.0,
                      child: Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Welcome back',
                                          style:
                                          FlutterFlowTheme.of(context).title1,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Login to access your account below.',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                        _model.emailAddressLoginController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Username',
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                          hintText: 'Enter your username...',
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 20.0, 24.0),
                                        ),
                                        style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                        validator: _model
                                            .emailAddressLoginControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.passwordLoginController,
                                        obscureText:
                                        !_model.passwordLoginVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                          hintText: 'Enter your password...',
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 20.0, 24.0),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                                  () => _model.passwordLoginVisibility =
                                              !_model.passwordLoginVisibility,
                                            ),
                                            focusNode:
                                            FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordLoginVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons.visibility_off_outlined,
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                        validator: _model
                                            .passwordLoginControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            GoRouter.of(context).prepareAuthEvent();
                                            final response = await AuthAPIProvider()
                                                .authenticate(
                                                username: _model
                                                    .emailAddressLoginController!
                                                    .text
                                                    .trim(),
                                                password: _model
                                                    .passwordLoginController!
                                                    .text
                                                    .trim());
                                            if (response['accessToken'] == null) {
                                              return;
                                            }

                                            FFAppState().accessToken =
                                            response['accessToken'];
                                            FFAppState().refreshToken =
                                            response['refreshToken'];

                                            await AuthAPIProvider()
                                                .processProfile();

                                            context.goNamedAuth('homePage', mounted);
                                          },
                                          text: 'Login',
                                          options: FFButtonOptions(
                                            width: 120.0,
                                            height: 50.0,
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle: FlutterFlowTheme.of(context)
                                                .subtitle2,
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
