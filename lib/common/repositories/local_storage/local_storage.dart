import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<void> setBoolValueForKey(bool value, String key);
  Future<bool> boolValueForKey(String key);
}

class LocalStorageImpl extends LocalStorage {
  Future<SharedPreferences> _sharedPreferences() async =>
      SharedPreferences.getInstance();

  @override
  Future<void> setBoolValueForKey(bool value, String key) async {
    return await _sharedPreferences()
      ..setBool(key, value);
  }

  @override
  Future<bool> boolValueForKey(String key) async {
    var sharedPreferences = await _sharedPreferences();
    return sharedPreferences.getBool(key);
  }
}
