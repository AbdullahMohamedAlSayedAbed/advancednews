import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  static Future<SharedPreferences> _getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  static Future<bool> setString(String key, String value) async {
    SharedPreferences prefs = await _getPreferences();
    return await prefs.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    SharedPreferences prefs = await _getPreferences();
    return await prefs.setInt(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    SharedPreferences prefs = await _getPreferences();
    return await prefs.setBool(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    SharedPreferences prefs = await _getPreferences();
    return await prefs.setDouble(key, value);
  }

  static Future<String?> getString(String key, [String? defaultValue]) async {
    SharedPreferences prefs = await _getPreferences();
    return prefs.getString(key) ?? defaultValue;
  }

  static Future<int?> getInt(String key, [int? defaultValue]) async {
    SharedPreferences prefs = await _getPreferences();
    return prefs.getInt(key) ?? defaultValue;
  }

  static Future<bool?> getBool(String key, [bool? defaultValue = false]) async {
    SharedPreferences prefs = await _getPreferences();
    return prefs.getBool(key) ?? defaultValue;
  }

  static Future<double?> getDouble(String key, [double? defaultValue]) async {
    SharedPreferences prefs = await _getPreferences();
    return prefs.getDouble(key) ?? defaultValue;
  }

  static Future<bool> remove(String key) async {
    SharedPreferences prefs = await _getPreferences();
    return await prefs.remove(key);
  }

  static Future<bool> clear() async {
    SharedPreferences prefs = await _getPreferences();
    return await prefs.clear();
}
}
