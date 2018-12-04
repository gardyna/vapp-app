import 'dart:async';

import 'package:vapp/util/network_util.dart';
import 'package:vapp/util/auth_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://vapp-server.herokuapp.com";
  static final LOGIN_URL = BASE_URL + "/rest-auth/login/";
  static final LOGOUT_URL = BASE_URL + "/rest-auth/logout";
  static final _API_KEY = "";

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
      return true;
    });
  }
}