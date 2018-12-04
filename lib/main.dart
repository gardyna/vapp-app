import 'package:flutter/material.dart';
import 'screens/auth/index.dart';
import 'screens/main/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/login': (BuildContext context) => Auth(),
    '/main': (BuildContext context) => MainScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Vapp',
      routes: routes,
      home: Auth(),
      theme: ThemeData(
        fontFamily: 'Cera-Pro',
        backgroundColor: Color.fromARGB(0, 23, 23, 23),
        primaryColor: Colors.black,
        primarySwatch: Colors.red,
        accentColor: Colors.black,
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 80.0,
          ),
          caption: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}