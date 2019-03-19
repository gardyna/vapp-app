import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:vapp/generated/i18n.dart';
import 'package:vapp/screens/sign_up/index.dart';
import 'package:vapp/screens/main/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/login': (BuildContext context) => SignUpPage(),
    '/main': (BuildContext context) => MainScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Vapp",
      routes: routes,
      home: SignUpPage(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        fontFamily: 'Cera-Pro',
        backgroundColor: Color.fromARGB(0, 18, 18, 18),
        //primaryColor: Colors.black,
        //primarySwatch: Colors.red,
        //accentColor: Colors.black,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, color: Colors.white),
          body1: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      ),
    );
  }
}