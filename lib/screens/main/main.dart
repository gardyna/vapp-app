import 'package:flutter/material.dart';
import 'package:vapp/services/rest.dart';


///
/// Main screen for app
/// for visual intent see diagram <Link: >
///
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(onPressed: () async {
          RestDatasource source = RestDatasource();
          await source.logout(); // remember await otherwise auth screen redirects back
          Navigator.of(context).pushNamed('/login');
        }, child: Text("LOGOUT")),
      ),
    );
  }
}