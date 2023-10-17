import 'package:DDD/app_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'api.dart';

class AuthAPIProvider {
  Future<dynamic> authenticate(
      {required String username, required String password}) async {
    try {
      final response = await api.post(
        '${FFAppState().baseUrl}/api/authenticate',
        data: {
          'username': username,
          'password': password,
        },
      );
      return response.data;
    } catch (e) {
      if (e.toString().contains('Connection refused')) {
        showToast(
          'CONNECTION_ERROR'.tr(),
          duration: Duration(seconds: 10),
          position: ToastPosition.bottom,
          backgroundColor: Colors.red,
          radius: 3.0,
          textStyle: TextStyle(fontSize: 15.0),
        );
      }
      return null;
    }
  }

  Future<void> processProfile() async {
    var response = await api.get(
      '${FFAppState().baseUrl}/api/account',
      options: Options(
        headers: {},
      ),
    );

    var data = await response.data;
    FFAppState().name = data['organisation']['name'];
    FFAppState().activationCode = data['organisation']['id'];
    FFAppState().outlet = data['organisation']['type'] == 'OUTLET';
    FFAppState().admin = data['organisation']['type'] == 'CO';
    FFAppState().displayDame = data['displayName'];

    response = await api.get(
      '${FFAppState().baseUrl}/api/ddd/customizations',
      options: Options(
        headers: {},
      ),
    );

    data = await response.data;
    FFAppState().requireName = data['requireName'];
    FFAppState().showTargetGroups = data['showTargetGroups'];
    FFAppState().heartbeat = data['heartbeat'];
    FFAppState().phoneRegex = data['phoneRegex'];
    FFAppState().phoneRequired = data['phoneRequired'];
  }
}
