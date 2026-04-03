import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource {
  static const _key = "user_name";

  Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? "";
  }
  
  Future<void> setUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, name);
  }
}
