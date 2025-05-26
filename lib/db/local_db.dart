import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  //set
  static Future setLoginStatus(bool loginStatus) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool('login', loginStatus);
  }

  static Future setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('token', token);
  }

  static Future setUserName(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('userName', token);
  }

  //get
  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  static Future<String> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName') ?? '';
  }

  static Future getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('login') ?? false;
  }

  static Future<Future<bool>> clearToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('token');
  }
}
