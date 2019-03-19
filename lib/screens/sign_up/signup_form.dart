import 'package:flutter/material.dart';
import 'package:vapp/widgets/email_field.dart';
import 'package:vapp/widgets/password_field.dart';

///
/// Form for filling out email and password
///
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
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: EmailField(
              controller: emailTextController,
              error: nameError,
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            color: Colors.white,
            child: PasswordField(
              controller: passwordTextController,
              error: passError,
            ),
          ),
          Text("->", style: Theme.of(context).textTheme.title),
        ],
      ),
    );
  }
}