import 'package:DDD/app_state.dart';

import 'api.dart';

class AuthAPIProvider {
  Future<dynamic> authenticate(
      {required String username, required String password}) async {
    final response = await api.post(
      '${FFAppState().baseUrl}/api/authenticate',
      data: {
        'username': username,
        'password': password,
      },
    );
    return response.data;
  }

  Future<void> processProfile() async {
    final response = await api.get(
      '${FFAppState().baseUrl}/api/account',
      options: Options(
        headers: {},
      ),
    );

    final data = await response.data;
    FFAppState().name = data['organisation']['name'];
    FFAppState().activationCode = data['organisation']['id'];
    FFAppState().outlet = data['organisation']['type'] == 'OUTLET';
    FFAppState().admin = data['organisation']['type'] == 'CO';
    FFAppState().displayDame = data['displayName'];
  }
}
