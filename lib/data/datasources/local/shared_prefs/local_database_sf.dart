import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDBServices {
  final String _loginKey = 'userLogin';

  /// get login Token
  Future<String?> getLoginToken() async {
    final df = DeshiFarmerAPI();
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_loginKey);
    // check if the token is valid or not
    final isAuth = await df.checkIfAuthenticated(token ?? '');
    // get value
    if (isAuth) {
      return token;
    } else {
      return null;
    }
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

  /*
    Some boolan values that used in the settings page
  */

  /// is notification enabled
  //* get NOTIFICATION ENABLED
  Future<bool?> isNotificationEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    return prefs.getBool('isNotificationEnabled');
  }

  //* set NOTIFICATION ENABLED
  Future<bool> setNotificationEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    debugPrint('setting notification enabled to TRUE');
    return prefs.setBool('isNotificationEnabled', true);
  }

  //* unset NOTIFICATION ENABLED
  Future<bool> unsetNotificationEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    debugPrint('setting notification enabled to FALSE');
    return prefs.setBool('isNotificationEnabled', false);
  }

  /// is email enabled
  //* get EMAIL ENABLED
  Future<bool?> isEmailEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    return prefs.getBool('isEmailEnabled');
  }

  //* set EMAIL ENABLED
  Future<bool> setEmailEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    return prefs.setBool('isEmailEnabled', true);
  }

  //* unset EMAIL ENABLED
  Future<bool> unsetEmailEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    return prefs.setBool('isEmailEnabled', false);
  }

  //* get WEAHTER ENABLED
  Future<bool?> isWeatherEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    return prefs.getBool('isWeatherEnabled');
  }

  //* set WEAHTER ENABLED
  Future<bool> setWeatherEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isWeatherEnabled', true);
  }

  //* unset WEAHTER ENABLED
  Future<bool> unsetWeatherEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isWeatherEnabled', false);
  }

  //* get PROMOTIONALS ENABLED
  Future<bool?> isPromotionalsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    return prefs.getBool('isPromotionalsEnabled');
  }

  //* set PROMOTIONALS ENABLED
  Future<bool> setPromotionalsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    return prefs.setBool('isPromotionalsEnabled', true);
  }

  //* unset PROMOTIONALS ENABLED
  Future<bool> unsetPromotionalsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    // get value
    return prefs.setBool('isPromotionalsEnabled', false);
  }
}
