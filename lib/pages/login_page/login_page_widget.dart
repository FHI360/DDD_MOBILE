import 'package:DDD/app_state.dart';
import 'package:DDD/backend/http/auth_api_provider.dart';
import 'package:DDD/flutter_flow/flutter_flow_model.dart';
import 'package:DDD/flutter_flow/flutter_flow_theme.dart';
import 'package:DDD/flutter_flow/flutter_flow_widgets.dart';
import 'package:DDD/flutter_flow/instant_timer.dart';
import 'package:DDD/flutter_flow/nav/nav.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
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

  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.emailAddressLoginController ??= TextEditingController();
    _model.passwordLoginController ??= TextEditingController();
    _model.baseUrlController ??=
        TextEditingController(text: FFAppState().baseUrl);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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
                                  24.0, 40.0, 24.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'PAGES.LOGIN.HERO'.tr(),
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
                                          labelText:
                                              'PAGES.LOGIN.USERNAME'.tr(),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          hintText:
                                              'PAGES.LOGIN.USERNAME_HINT'.tr(),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 24.0, 20.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        validator: _model
                                            .emailAddressLoginControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.passwordLoginController,
                                        obscureText:
                                            !_model.passwordLoginVisibility,
                                        decoration: InputDecoration(
                                          labelText:
                                              'PAGES.LOGIN.PASSWORD'.tr(),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          hintText:
                                              'PAGES.LOGIN.PASSWORD_HINT'.tr(),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 24.0, 20.0, 24.0),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _model
                                                      .passwordLoginVisibility =
                                                  !_model
                                                      .passwordLoginVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.passwordLoginVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
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
                                          onPressed: (_model.formKey
                                                          .currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate() ||
                                                  _model
                                                      .passwordLoginController!
                                                      .text
                                                      .isEmpty ||
                                                  _model
                                                      .emailAddressLoginController!
                                                      .text
                                                      .isEmpty)
                                              ? null
                                              : () async {
                                                  if (FFAppState()
                                                      .baseUrl
                                                      .isEmpty) {
                                                    showToast(
                                                      'PAGES.LOGIN.URL_MESSAGE'
                                                          .tr(),
                                                      duration:
                                                          Duration(seconds: 2),
                                                      position:
                                                          ToastPosition.bottom,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .errorRed,
                                                      radius: 3.0,
                                                      textStyle: TextStyle(
                                                          fontSize: 15.0),
                                                    );

                                                    return;
                                                  }
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();
                                                  final response =
                                                      await AuthAPIProvider()
                                                          .authenticate(
                                                              username: _model
                                                                  .emailAddressLoginController!
                                                                  .text
                                                                  .trim(),
                                                              password: _model
                                                                  .passwordLoginController!
                                                                  .text
                                                                  .trim());
                                                  if (response == null ||
                                                      response['accessToken'] ==
                                                          null) {
                                                    return;
                                                  }

                                                  FFAppState().accessToken =
                                                      response['accessToken'];
                                                  FFAppState().refreshToken =
                                                      response['refreshToken'];

                                                  await AuthAPIProvider()
                                                      .processProfile();

                                                  context.pushNamed('homePage');
                                                },
                                          text: 'PAGES.LOGIN.SIGN_IN'.tr(),
                                          options: FFButtonOptions(
                                            width: 120.0,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                            Spacer(),
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.always,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 20.0, 12.0, 20.0),
                                child: TextFormField(
                                  controller: _model.baseUrlController,
                                  obscureText: false,
                                  keyboardType: TextInputType.url,
                                  onChanged: (val) async {
                                    if (!val.startsWith('http')) {
                                      val = 'https://' + val;
                                    }
                                    if (val.endsWith('/')) {
                                      val = val.substring(0, val.length - 1);
                                    }
                                    FFAppState().update(() {
                                      FFAppState().baseUrl = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'PAGES.LOGIN.BASE_URL'.tr(),
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    hintText: 'PAGES.LOGIN.BASE_URL_HINT'.tr(),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 20.0, 24.0),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  validator: _model.baseUrlControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    '2023.1 02-08-2023',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//2023.1 14-07-2023
