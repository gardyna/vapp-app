import 'package:flutter/material.dart';

class SigninButton extends StatelessWidget {
  Function onPress;

  SigninButton({this.onPress});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Sign in',
        style: Theme.of(context).primaryTextTheme.body1,
      ),
      onPressed: onPress,
      color: Colors.black,
      
    );
  }
}