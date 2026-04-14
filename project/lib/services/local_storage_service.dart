import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  void _checkInit() {
    if (_prefs == null) throw StateError('LocalStorageService not initialized');
  }

  Future<void> setString(String key, String value) async {
    _checkInit();
    await _prefs!.setString(key, value);
  }

  String? getString(String key) {
    _checkInit();
    return _prefs!.getString(key);
  }

  Future<void> remove(String key) async {
    _checkInit();
    await _prefs!.remove(key);
  }

  Future<void> clear() async {
    _checkInit();
    await _prefs!.clear();
  }
}
