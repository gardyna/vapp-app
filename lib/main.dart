import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:vapp/generated/i18n.dart';
import 'package:vapp/screens/auth/index.dart';
import 'package:vapp/screens/main/index.dart';

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
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
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