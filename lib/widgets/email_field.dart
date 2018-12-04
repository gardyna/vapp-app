import 'package:flutter/material.dart';


class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final String error;
  EmailField({this.controller, this.error});

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        errorText: this.error,
        border: OutlineInputBorder(),
        labelText: 'email',
        labelStyle: TextStyle(
          color: Colors.black
        )
      ),
    );
  }
}