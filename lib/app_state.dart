import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true));
    _rememberMe = await secureStorage.getBool('ff_rememberMe') ?? _rememberMe;
    _passphrase = await secureStorage.getString('ff_passphrase') ?? _passphrase;
    _accessToken =
        await secureStorage.getString('ff_accessToken') ?? _accessToken;
    _activationCode =
        await secureStorage.getString('ff_activationCode') ?? _activationCode;
    _outlet = await secureStorage.getBool('ff_outlet') ?? _outlet;
    _name = await secureStorage.getString('ff_name') ?? _name;
    _baseUrl = await secureStorage.getString('ff_baseUrl') ?? _baseUrl;
    _admin = await secureStorage.getBool('ff_admin') ?? _admin;
    _displayDame =
        await secureStorage.getString('ff_displayDame') ?? _displayDame;
    _phoneRegex =
        await secureStorage.getString('ff_phoneRegex') ?? _phoneRegex;
    _facility = await secureStorage.getString('ff_facility') ?? _facility;
    _username = await secureStorage.getString('ff_username') ?? _username;
    _requireName =
        await secureStorage.getBool('ff_requireName') ?? _requireName;
    _showTargetGroups =
        await secureStorage.getBool('ff_showTargetGroups') ?? _showTargetGroups;
    _heartbeat = await secureStorage.getInt('ff_heartbeat') ?? _heartbeat;
    _activeHeartbeat =
        await secureStorage.getInt('ff_activeHeartbeat') ?? _activeHeartbeat;
    _phoneRequired =
        await secureStorage.getBool('ff_phoneRequired') ?? _phoneRequired;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _accessToken = '';

  String get accessToken => _accessToken;

  set accessToken(String _value) {
    _accessToken = _value;
    secureStorage.setString('ff_accessToken', _value);
  }

  String _activationCode = '';

  String get activationCode => _activationCode;

  set activationCode(String _value) {
    _activationCode = _value;
    secureStorage.setString('ff_activationCode', _value);
  }

  String _passphrase = '';

  String get passphrase => _passphrase;

  set passphrase(String _value) {
    _passphrase = _value;
    secureStorage.setString('ff_passphrase', _value);
  }

  String _username = '';

  String get username => _username;

  set username(String _value) {
    _username = _value;
    secureStorage.setString('ff_username', _value);
  }

  int _heartbeat = 2;

  int get heartbeat => _heartbeat;

  set heartbeat(int _value) {
    _heartbeat = _value;
    secureStorage.setInt('ff_heartbeat', _value);
  }

  int _activeHeartbeat = 0;

  int get activeHeartbeat => _activeHeartbeat;

  set activeHeartbeat(int _value) {
    _activeHeartbeat = _value;
    secureStorage.setInt('ff_activeHeartbeat', _value);
  }

  String _name = '';

  String get name => _name;

  set name(String _value) {
    _name = _value;
    secureStorage.setString('ff_name', _value);
  }

  String _displayDame = '';

  String get displayDame => _displayDame;

  set displayDame(String _value) {
    _displayDame = _value;
    secureStorage.setString('ff_displayDame', _value);
  }

  String _baseUrl = '';

  String get baseUrl => _baseUrl;

  set baseUrl(String _value) {
    _baseUrl = _value;
    secureStorage.setString('ff_baseUrl', _value);
  }

  bool _outlet = false;

  bool get outlet => _outlet;

  set outlet(bool _value) {
    _outlet = _value;
    secureStorage.setBool('ff_outlet', _outlet);
  }

  bool _rememberMe = false;

  bool get rememberMe => _outlet;

  set rememberMe(bool _value) {
    _rememberMe = _value;
    secureStorage.setBool('ff_rememberMe', _rememberMe);
  }

  bool _requireName = true;

  bool get requireName => _requireName;

  set requireName(bool _value) {
    _requireName = _value;
    secureStorage.setBool('ff_requireName', _requireName);
  }

  bool _showTargetGroups = false;

  bool get showTargetGroups => _showTargetGroups;

  set showTargetGroups(bool _value) {
    _showTargetGroups = _value;
    secureStorage.setBool('ff_showTargetGroups', _showTargetGroups);
  }

  bool _admin = false;

  bool get admin => _admin;

  set admin(bool _value) {
    _admin = _value;
    secureStorage.setBool('ff_admin', _admin);
  }

  bool _phoneRequired = false;

  bool get phoneRequired => _phoneRequired;

  set phoneRequired(bool _value) {
    _phoneRequired = _value;
    secureStorage.setBool('ff_phoneRequired', _phoneRequired);
  }

  String _facility = '';

  String get facility => _facility;

  set facility(String _value) {
    _facility = _value;
    secureStorage.setString('ff_facility', _facility);
  }

  String _phoneRegex = '';

  String get phoneRegex => _phoneRegex;

  set phoneRegex(String _value) {
    _phoneRegex = _value;
    secureStorage.setString('ff_phoneRegex', _phoneRegex);
  }
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);

  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';

  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');

  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');

  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });

  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
