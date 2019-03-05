import 'package:flutter/material.dart';


class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String error;
  String text;
  PasswordField({Key key, this.controller, this.error, this.text}) : super(key: key);

  @override
  State<PasswordField> createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField>{
  bool _hidden = true;

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
        border: UnderlineInputBorder(),
        suffixIcon: FlatButton.icon(
          onPressed: (){
            setState(() {
              _hidden = !_hidden;
            });
          },
          icon: Icon(_hidden == true ? Icons.lock : Icons.lock_open),
          label: Container()
        ),
        labelText: widget.text ?? 'Password',
        contentPadding: EdgeInsets.all(10)
      ),
    );
  }
}