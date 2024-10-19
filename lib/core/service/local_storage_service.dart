import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  late SharedPreferences _sharedPreferences;

  Future<void> getInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData(String key, String value) async {
    await getInstance();
    await _sharedPreferences.setString(key, value);
  }

  Future<String?> getData(String key) async {
    await getInstance();
    return _sharedPreferences.getString(key) ?? '';
  }

  Future<void> removeData(String key) async {
    await getInstance();
    await _sharedPreferences.remove(key);
  }
}
