import 'package:flutter/material.dart';
import 'package:vapp/util/auth_util.dart';
import 'package:vapp/widgets/email_field.dart';
import 'package:vapp/widgets/password_field.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Center(
                      child: Text("Sign Up", style: Theme.of(context).textTheme.title,)
                  ),
                flex: 4,
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: EmailField(controller: emailTextController, error: nameError),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  color: Colors.white,
                  child: PasswordField(controller: passwordTextController, error: passError),
                ),
              ),
              Flexible(
                flex: 1,
                  child: Center(
                      child: Text("or use", style: Theme.of(context).textTheme.body1,),
                  )
              ),
              Expanded(
                flex: 4,
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}