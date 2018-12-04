import 'package:shared_preferences/shared_preferences.dart';

class AuthUtil{
  static const _STORE_KEY = "AUTH_KEY";

  static void saveCredential(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(_STORE_KEY, token);
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(_STORE_KEY) != null;
  }

  static void removeCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_STORE_KEY);
  }
}