import 'package:DDD/app_state.dart';
import 'package:DDD/main.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class ErrorDialogInterceptor extends Interceptor {

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    if(err.requestOptions.path.contains('/api/ddd/device-profile')) {
      return super.onError(err, handler);
    }

    if(err.response == null) {
      showToast(
        'CONNECTION_ERROR'.tr(),
        duration: Duration(seconds: 2),
        position: ToastPosition.bottom,
        backgroundColor: Colors.redAccent,
        radius: 1.0,
        textStyle: TextStyle(fontSize: 15.0),
      );
      return super.onError(err, handler);
    }

    final data = err.response?.data;

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
      var body = err.response?.data!;
      var message = 'SESSION_EXPIRED'.tr();
      if (body['detail'] == 'ACCESS.MANAGEMENT.ERRORS.WRONG_CREDENTIALS') {
        message = 'INVALID_CREDENTIALS'.tr();
      } else if (body['detail'] ==
          'ACCESS.MANAGEMENT.ERRORS.FAILED_ATTEMPTS_LOCK') {
        message = 'LOCKED_FAILED_LOGINS'.tr();
      } else if (body['detail'] ==
          'ACCESS.MANAGEMENT.ERRORS.ACCOUNT_DISABLED') {
        message = 'ACCOUNT_LOCKED'.tr();
      } else if (body['detail'] == 'ACCESS.MANAGEMENT.ERRORS.TOKEN_EXPIRED') {
        message = 'SESSION_EXPIRED'.tr();
      }
      showToast(
        message,
        duration: Duration(seconds: 15),
        position: ToastPosition.bottom,
        backgroundColor: Colors.red,
        radius: 4.0,
        textStyle: TextStyle(fontSize: 15.0),
      );
      FFAppState().accessToken = '';
      FFAppState().activationCode = '';
      FFAppState().name = '';

      router.pushNamed('loginPage');
      return super.onError(err, handler);
    }

    if (data['path'] != '/api/ddd/device-profile') {
      showToast(
        'PROCESSING_ERROR'.tr(),
        duration: Duration(seconds: 2),
        position: ToastPosition.bottom,
        backgroundColor: Colors.redAccent,
        radius: 1.0,
        textStyle: TextStyle(fontSize: 15.0),
      );
    }
    return super.onError(err, handler);
  }
}
