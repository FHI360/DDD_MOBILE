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
    secureStorage = FlutterSecureStorage();
    _refreshToken =
        await secureStorage.getString('ff_refreshToken') ?? _refreshToken;
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
    _facility = await secureStorage.getString('ff_facility') ?? _facility;
    _requireName =
        await secureStorage.getBool('ff_requireName') ?? _requireName;
    _showTargetGroups =
        await secureStorage.getBool('ff_showTargetGroups') ?? _showTargetGroups;
    _currentLockWait =
        await secureStorage.getInt('ff_currentLockWait') ?? _currentLockWait;
    _activeLockWait =
        await secureStorage.getInt('ff_activeLockWait') ?? _activeLockWait;
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

  int _currentLockWait = 230;

  int get currentLockWait => _currentLockWait;

  set currentLockWait(int _value) {
    _currentLockWait = _value;
    secureStorage.setInt('ff_currentLockWait', _value);
  }

  int _activeLockWait = 230;

  int get activeLockWait => _activeLockWait;

  set activeLockWait(int _value) {
    _activeLockWait = _value;
    secureStorage.setInt('ff_activeLockWait', _value);
  }

  String _refreshToken = '';

  String get refreshToken => _refreshToken;

  set refreshToken(String _value) {
    _refreshToken = _value;
    secureStorage.setString('ff_refreshToken', _value);
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

  String _facility = '';

  String get facility => _facility;

  set facility(String _value) {
    _facility = _value;
    secureStorage.setString('ff_facility', _facility);
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
