import 'package:flutter/material.dart';
import 'package:vapp/services/rest.dart';
import 'package:vapp/widgets/email_field.dart';
import 'package:vapp/widgets/password_field.dart';
import 'package:vapp/widgets/signin_button.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginFormState();
  }

}

class LoginFormState extends State<LoginForm> {
  String passError, nameError;

  TextEditingController emailTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();

  void _signin() async {
    final String pass = passwordTextController.text;
    final String email = emailTextController.text;
    String passErrorText, usernameError;
    // validate password
    if(pass.length < 5){
      passErrorText = 'Password must be longer than 5 characters';
    } else if (!['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
        .any((c) => pass.contains(c))){
      passErrorText = 'Password must include numbers';
    } else if (pass.toLowerCase() == pass || pass.toUpperCase() == pass) {
      passErrorText = 'Password must include both lower and upper case characters';
    } else if (email.isEmpty){
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

    bool loggedIn = await api.login(email, pass);
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
    return Column(
      children: <Widget>[
        Text("SIGN IN", textScaleFactor: 2.0,),
        EmailField(
          controller: emailTextController,
          error: nameError,
        ),
        Container(height: 10.0,),
        PasswordField(
          controller: passwordTextController,
          error: passError,
        ),
        Container(height: 10.0,),
        SigninButton(
          onPress: _signin,
        )
      ],
    );
  }
}