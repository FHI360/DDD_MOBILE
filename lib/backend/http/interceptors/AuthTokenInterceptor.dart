import 'package:DDD/app_state.dart';
import 'package:DDD/main.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class AuthTokenInterceptor extends Interceptor {
  static const skipHeader = 'skipAuthToken';

  Dio api;

  AuthTokenInterceptor(this.api);

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = FFAppState().accessToken;
    final path = options.path;
    if (accessToken != '' &&
        !(path == '/api/authenticate' || path == '/api/refresh-token')) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return super.onRequest(options, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    final response = err.response?.data;

    if (response == null) {
      return super.onError(err, handler);
    }

    if (err.response?.statusCode == 401 && FFAppState().refreshToken != '') {
      return _handlerRefreshToken(FFAppState().refreshToken, err, handler);
    }

    return super.onError(err, handler);
  }

  _handlerRefreshToken(
    String refreshToken,
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    final requestOptions = err.requestOptions;

    if (requestOptions.headers.containsKey(skipHeader)) {
      return super.onError(err, handler);
    }

    try {
      final headers = requestOptions.headers;

      headers[skipHeader] = true;

      final finalResponse = await api.request(
        requestOptions.path,
        cancelToken: requestOptions.cancelToken,
        data: requestOptions.data,
        onReceiveProgress: requestOptions.onReceiveProgress,
        onSendProgress: requestOptions.onSendProgress,
        queryParameters: requestOptions.queryParameters,
        options: Options(
          method: requestOptions.method,
          headers: headers,
        ),
      );

      return handler.resolve(finalResponse);
    } on DioError catch (e) {
      return handler.next(e);
    } catch (e) {
      showToast(
        'SESSION_EXPIRED'.tr(),
        duration: Duration(seconds: 5),
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
  }
}
