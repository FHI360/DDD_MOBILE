import 'package:DDD/app_state.dart';
import 'package:DDD/main.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'AuthTokenInterceptor.dart';

class ErrorDialogInterceptor extends Interceptor {
  static const skipHeader = 'skipDialog';

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    final data = err.response?.data;

    final refreshToken = FFAppState().refreshToken;

    if (data == null ||
        !(data is Map) ||
        err.response?.statusCode == 401 &&
            (refreshToken != '') &&
            !err.requestOptions.headers
                .containsKey(AuthTokenInterceptor.skipHeader)) {
      return super.onError(err, handler);
    }
    if (err.response?.statusCode == 403 &&
        data['path'] == '/api/authenticate') {
      showToast(
        'INVALID_CREDENTIALS'.tr(),
        duration: Duration(seconds: 2),
        position: ToastPosition.bottom,
        backgroundColor: Colors.red,
        radius: 3.0,
        textStyle: TextStyle(fontSize: 15.0),
      );
      return super.onError(err, handler);
    }

    if (err.response?.statusCode == 401) {
      showToast(
        'SESSION_EXPIRED'.tr(),
        duration: Duration(seconds: 10),
        position: ToastPosition.bottom,
        backgroundColor: Colors.red,
        radius: 3.0,
        textStyle: TextStyle(fontSize: 15.0),
      );
      FFAppState().refreshToken = '';
      FFAppState().accessToken = '';
      FFAppState().activationCode = '';
      FFAppState().name = '';

      router.pushNamed('loginPage');
      return super.onError(err, handler);
    }

    if (err.response?.statusCode == 404 &&
        err.response?.data['path'] == '/api/account' &&
        router.location != '/login') {
      showToast(
        'SESSION_EXPIRED'.tr(),
        duration: Duration(seconds: 10),
        position: ToastPosition.bottom,
        backgroundColor: Colors.red,
        radius: 3.0,
        textStyle: TextStyle(fontSize: 15.0),
      );
      router.pushNamed('loginPage');
      return super.onError(err, handler);
    }
    if (err.response?.statusCode == 404 &&
        err.response?.data['path'] == '/api/account' &&
        router.location == '/login') {
      return super.onError(err, handler);
    }
    showToast(
      'PROCESSING_ERROR'.tr(),
      duration: Duration(seconds: 2),
      position: ToastPosition.bottom,
      backgroundColor: Colors.redAccent,
      radius: 1.0,
      textStyle: TextStyle(fontSize: 15.0),
    );
    return super.onError(err, handler);
  }
}
