import 'dart:async';

import 'package:vapp/util/network_util.dart';
import 'package:vapp/util/auth_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static const BASE_URL = "https://vapp-server.herokuapp.com";
  static const LOGIN_URL = BASE_URL + "/rest-auth/login/";
  static const LOGOUT_URL = BASE_URL + "/rest-auth/logout/";

  Future<bool> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "username": username,
      "password": password,
    }).then((dynamic res) {
      print(res.toString());
      AuthUtil.saveCredential(res['key']);
      return true;
    });
  }

  Future<bool> logout(){
    return _netUtil.post(LOGOUT_URL)
        .then((dynamic res) {
      AuthUtil.removeCredentials();
      return true;
    });
  }
}