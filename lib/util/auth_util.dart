import 'package:shared_preferences/shared_preferences.dart';

class AuthUtil{
  static const _STORE_KEY = "AUTH_KEY";

  static void saveCredential(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(_STORE_KEY, token);
  }
}