import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDBServices {
  final String _loginKey = 'userLogin';

  /// get login Token
  Future<String?> getLoginToken() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    return prefs.getString(_loginKey);
  }

  /// remove login Token
  Future<bool?> removeLoginToken() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    return prefs.remove(_loginKey);
  }

  /// set login Token
  Future<bool> setLoginToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    return prefs.setString(_loginKey, token);
  }
}
