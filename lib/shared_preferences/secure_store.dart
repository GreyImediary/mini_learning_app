import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static FlutterSecureStorage? _secureStorage;

  static Future<void> saveString(String key, String value) async {
    await _getStorage().write(key: key, value: value);
  }

  static Future<String?> getString(String key) async {
    return await _getStorage().read(key: key);
  }

  static Future<void> saveInt(String key, int value) async {
   await _getStorage().write(key: key, value: value.toString());
  }

  static Future<int?> getInt(String key) async {
    return int.tryParse(await _getStorage().read(key: key) ?? '');
  }

  static Future<void> clear () async {
    _getStorage().deleteAll();
  }

  static FlutterSecureStorage _getStorage() {
    if (_secureStorage == null) {
      _secureStorage = FlutterSecureStorage();
      return _secureStorage!;
    } else {
      return _secureStorage!;
    }
  }
}