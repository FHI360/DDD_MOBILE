import 'dart:io';

import 'package:DDD/backend/http/api.dart';
import 'package:DDD/flutter_flow/flutter_flow_util.dart';
import 'package:DDD/main.dart';
import 'package:device_imei/device_imei.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class DeviceInfoService {
  String _platformVersion = 'Unknown';
  String? deviceImei;
  String? type;
  String message = "Please allow permission request!";
  DeviceInfo? deviceInfo;
  bool getPermission = false;
  bool isloading = false;

  //final _deviceImeiPlugin = DeviceImei();

  /*_getImei() async {
    var permission = await Permission.phone.status;

    DeviceInfo? dInfo = await _deviceImeiPlugin.getDeviceInfo();

    if (dInfo != null) {
      deviceInfo = dInfo;
    }

    if (Platform.isAndroid) {
      if (permission.isGranted) {
        String? imei = await _deviceImeiPlugin.getDeviceImei();
        if (imei != null) {
          getPermission = true;
        }
      } else {
        PermissionStatus status = await Permission.phone.request();
        if (status == PermissionStatus.granted) {
          getPermission = false;
          _getImei();
        } else {
          getPermission = false;
          message = "Permission not granted, please allow permission";
        }
      }
    } else {
      String? imei = await _deviceImeiPlugin.getDeviceImei();
      if (imei != null) {
        getPermission = true;
        deviceImei = imei;
      }
    }
  }*/

  /* Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _deviceImeiPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    _platformVersion = platformVersion;
  }*/

  Future<void> syncProfile() async {
    try {
      //await _getImei();
      var status = await Permission.location.isDenied;
      if (status) {
        openAppSettings();
      }
      var currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng.instance());
      final Map<String, dynamic> payload = new Map<String, dynamic>();
      /*
      payload['id'] = deviceInfo?.deviceId;
      payload['sdk'] = deviceInfo?.sdkInt;
      payload['model'] = deviceInfo?.model;
      payload['manufacturer'] = deviceInfo?.manufacture;
      payload['device'] = deviceInfo?.device;*/
      payload['code'] = FFAppState().activationCode;
      payload['version'] = currentVersion;
      payload['lat'] = currentUserLocationValue.latitude;
      payload['lng'] = currentUserLocationValue.longitude;
      //payload['imei'] = getPermission ? deviceImei : message;

      final response = await api.post(
        '${FFAppState().baseUrl}/api/ddd/device-profile',
        data: payload,
      );

      var data = await response.data;
      FFAppState().requireName = data['requireName'];
      FFAppState().showTargetGroups = data['showTargetGroups'];
      FFAppState().heartbeat = data['heartbeat'];
      FFAppState().phoneRegex = data['phoneRegex'];
      FFAppState().phoneRequired = data['phoneRequired'];
    } catch (e) {
      if(e is DioError) {
        var data = e.response?.data;
        if(data != null && data['status'] == 401) {
          FFAppState().accessToken = '';
          FFAppState().activationCode = '';
          FFAppState().name = '';

          router.pushNamed('loginPage');
        }
      }
    }
  }
}
