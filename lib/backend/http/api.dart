import 'dart:io';

import 'package:DDD/app_state.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'interceptors/AuthTokenInterceptor.dart';
import 'interceptors/error_dialog_interceptor.dart';

export 'package:dio/dio.dart';

Dio _createHttpClient() {
  final api = new Dio(
    new BaseOptions(
      baseUrl: FFAppState().baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ),
  );
  var onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  api
    ..interceptors.add(new ErrorDialogInterceptor())
    ..interceptors.add(new AuthTokenInterceptor(api))
    ..interceptors.add(
      AwesomeDioInterceptor(
        // Disabling headers and timeout would minimize the logging output.
        // Optional, defaults to true
        logRequestTimeout: false,
        logRequestHeaders: false,
        logResponseHeaders: false,

        // Optional, defaults to the 'log' function in the 'dart:developer' package.
        logger: debugPrint,
      ),
    );

  return api;
}

final api = _createHttpClient();
