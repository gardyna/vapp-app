import 'package:flutter/material.dart';
import 'package:vapp/services/rest.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(onPressed: (){
          RestDatasource source = RestDatasource();
          source.logout();
          Navigator.of(context).pushNamed('/login');
          //Navigator.of(context).popAndPushNamed('/login');
        }, child: Text("LOGOUT")),
      ),
    );
  }

}