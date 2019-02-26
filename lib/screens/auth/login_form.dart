import 'package:flutter/material.dart';
import 'package:vapp/generated/i18n.dart';
import 'package:vapp/services/rest.dart';
import 'package:vapp/widgets/email_field.dart';
import 'package:vapp/widgets/password_field.dart';
import 'package:vapp/widgets/signin_button.dart';


///
/// Login form containing email field and password field
/// along with social media access
///
class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginFormState();
  }
}

///
/// Defines render and state for login form component
///
class LoginFormState extends State<LoginForm> {
  String passError, nameError;

  TextEditingController emailTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();

  void _signIn() async {
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
    // route if successful
    if (loggedIn) {
      print("success");
      Navigator.of(context).popAndPushNamed('/main');
    } else {
      // something went wrong set general error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(S.of(context).sign_in, textScaleFactor: 2.0,),
          Container(height: 60.0,),
          EmailField(
            controller: emailTextController,
            error: nameError,
          ),
          Container(height: 20.0,),
          PasswordField(
            controller: passwordTextController,
            error: passError,
          ),
          Container(height: 20.0,),
          SigninButton(
            onPress: _signIn,
          ),

          Container(height: 10.0,),
          Text(S.of(context).or_use),
          Container(height: 50.0,),
          Text("Swipe to sign up"),
          Text("->"),
        ],
      ),
    );
  }
}