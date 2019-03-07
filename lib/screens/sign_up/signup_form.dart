import 'package:flutter/material.dart';
import 'package:vapp/generated/i18n.dart';
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
  TextEditingController passwordReTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(

          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("SIGN UP", textScaleFactor: 2.0),
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
            PasswordField(
              controller: passwordTextController,
              error: passError,
              text: "Re-enter password",
            ),

            Container(height: 10.0,),
            Text(S.of(context).or_use),
            Container(height: 50.0,),
            Text("Already have an acount?"),
            Text("<-"),
          ],
      ),
    );

  }

}