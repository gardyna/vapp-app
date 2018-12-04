import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vapp/screens/auth/login_form.dart';
import 'package:vapp/services/rest.dart';
import 'package:vapp/widgets/password_field.dart';
import 'package:vapp/widgets/email_field.dart';
import 'package:vapp/widgets/signin_button.dart';

class Auth extends StatefulWidget {
  @override
  State<Auth> createState()  => AuthState();
}

class AuthState extends State<Auth> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _passhidden = true;
  bool _isLoading = false;
  String passError, nameError;

  TextEditingController usernameTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();

  LoginForm _loginForm = LoginForm();

  @override
  void initState(){
    super.initState();
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



  void _signin() async {
    final String pass = passwordTextController.text;
    final String username = usernameTextController.text;
    String passErrorText, usernameError;
    // validate password
    if(pass.length < 5){
      passErrorText = 'Password must be longer than 5 characters';
    } else if (!['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
        .any((c) => pass.contains(c))){
      passErrorText = 'Password must include numbers';
    } else if (pass.toLowerCase() == pass || pass.toUpperCase() == pass) {
      passErrorText = 'Password must include both lower and upper case characters';
    } else if (username.isEmpty){
      usernameError = 'Username must be filled in';
    }
    // attempt signin
    if(passErrorText != null || usernameError != null){
      setState(() {
        passError = passErrorText;
        nameError = usernameError;
      });
      return;
    }
    RestDatasource api = new RestDatasource();

    bool loggedIn = await api.login(username, pass);
    // route if succesfull
    if (loggedIn) {
      print("success");
      Navigator.of(context).popAndPushNamed('/main');
    } else {
      // something went wrong set general error
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