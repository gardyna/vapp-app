import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vapp/generated/i18n.dart';
import 'package:vapp/screens/auth/login_form.dart';
import 'package:vapp/screens/auth/signup_form.dart';
import 'package:vapp/util/auth_util.dart';

class Auth extends StatefulWidget {
  @override
  State<Auth> createState()  => AuthState();
}

class AuthState extends State<Auth> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  String passError, nameError;

  PageController _pageController = new PageController();

  TextEditingController usernameTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();

  LoginForm _loginForm = LoginForm();

  @override
  void initState(){
    super.initState();
    fetchSessionAndNavigate();
  }


  void fetchSessionAndNavigate() async {
    bool hasToken = await AuthUtil.isLoggedIn();
    if (hasToken) {
      Navigator.of(context).popAndPushNamed('/main');
    } else {
      print("No session, wait for login attempt");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(S.of(context).vapp,
              style: Theme.of(context).primaryTextTheme.title,
            ),
            Text(S.of(context).app_subtitle,
              style: Theme.of(context).primaryTextTheme.caption,
            ),
            Container(height: 60.0,),
            Container(
              child: Expanded(
                flex: 2,

                child: PageView(
                  controller: _pageController,
                  onPageChanged: (i){
                    // set state to know which form is visible
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: LoginForm(),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: SignUpForm(),
                    )
                  ],
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}