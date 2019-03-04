import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vapp/generated/i18n.dart';
import 'package:vapp/screens/auth/login_form.dart';
import 'package:vapp/screens/auth/signup_form.dart';
import 'package:vapp/util/auth_util.dart';
import 'package:vapp/widgets/email_field.dart';
import 'package:vapp/widgets/password_field.dart';

class Auth extends StatefulWidget {
  @override
  State<Auth> createState()  => AuthState();
}

class AuthState extends State<Auth> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  String passError, nameError;

  TextEditingController emailTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();

  LoginForm _loginForm = LoginForm();

  @override
  void initState(){
    super.initState();
    fetchSessionAndNavigate();
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
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Sign Up", style: Theme.of(context).textTheme.title,),
              Container(
                color: Colors.white,
                child: EmailField(controller: emailTextController, error: nameError),
              ),
              Container(height: 10,),
              Container(
                color: Colors.white,
                child: PasswordField(controller: passwordTextController, error: passError),
              ),
              Container(height: 10,),
              Text("or use", style: Theme.of(context).textTheme.body1,),
            ],
          ),
        ),
      ),
    );
  }
}