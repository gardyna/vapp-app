import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vapp/screens/auth/login_form.dart';
import 'package:vapp/util/auth_util.dart';

class Auth extends StatefulWidget {
  @override
  State<Auth> createState()  => AuthState();
}

class AuthState extends State<Auth> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String passError, nameError;

  TextEditingController usernameTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();

  LoginForm _loginForm = LoginForm();

  @override
  void initState(){
    super.initState();
    fetchSessionAndNavigate();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  @override
  dispose(){
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }


  void fetchSessionAndNavigate() async {
    bool hasToken = await AuthUtil.isLoggedIn();
    if (hasToken) {
      Navigator.of(context).popAndPushNamed('/main');
    } else {
      print("No session, wait for login attempt");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Vapp",
              style: Theme.of(context).primaryTextTheme.title,
            ),
            Text("The event app",
              style: Theme.of(context).primaryTextTheme.caption,
            ),
            Container(height: 50.0,),
            Container(
              child: _loginForm,
              width: 300.0,
              padding: EdgeInsets.all(8.0),
              //margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),
            ),
          ],
        )
      ),
    );
  }
}