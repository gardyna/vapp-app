import 'package:flutter/material.dart';


class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String error;
  PasswordField({Key key, this.controller, this.error}) : super(key: key);

  @override
  State<PasswordField> createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField>{
  bool _hidden = true;
  String _error;

  @override
  void initState() {
    super.initState();
    _hidden = true;
  }

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: widget.controller,
      obscureText: _hidden,
      decoration: InputDecoration(
        errorText: widget.error,
        border: OutlineInputBorder(),
        suffixIcon: FlatButton.icon(
          onPressed: (){
            setState(() {
              _hidden = !_hidden;
            });
          },
          icon: Icon(_hidden == true ? Icons.lock : Icons.lock_open),
          label: Container()
        ),
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.black,
        )
      ),
    );
  }
}