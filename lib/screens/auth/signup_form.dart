import 'package:flutter/material.dart';
import 'package:vapp/widgets/email_field.dart';
import 'package:vapp/widgets/password_field.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUpFormState();

}

class SignUpFormState extends State<SignUpForm> {
  String passError, nameError;

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();


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
      ],
    );

  }

}