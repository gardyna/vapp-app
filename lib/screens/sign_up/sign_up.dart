import 'package:flutter/material.dart';
import 'package:vapp/screens/sign_up/signup_form.dart';
import 'package:vapp/util/auth_util.dart';
import 'package:vapp/screens/sign_up/social_buttons.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState()  => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  String passError, nameError;

  TextEditingController emailTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();

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
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Center(
                  child: Text("SIGN UP",
                    style: Theme.of(context).textTheme.title,
                  ),
              ),
            flex: 4,
          ),
          SignUpForm(),
          Flexible(
            flex: 1,
              child: Center(
                  child: Text("or use",
                    style: Theme.of(context).textTheme.body1,
                  ),
              )
          ),
          Flexible(
            flex: 1,
            child: new SocialButtons(buttonSize: 50.0,),
          ),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("already have an account?",
                        style: Theme.of(context).textTheme.body1,
                      ),
                      Text(" log in",
                        style: Theme.of(context).textTheme.body1
                            .apply(color: Colors.blue),
                      ),
                    ],
                  ),
                  onTap: () {
                    print("Navigate to log in");
                  },
                ),
              ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          )
        ],
      ),
    );
  }
}
