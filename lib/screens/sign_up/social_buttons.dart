import 'package:flutter/material.dart';
import 'package:vapp/Presentation/social_icons_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class SocialButtons extends StatelessWidget {
  final double buttonSize;

  const SocialButtons({
    Key key,
    this.buttonSize,
  }) : super(key: key);

  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ]
  );

  void _signInGoogle(BuildContext context) async {
    try {
      print("google sign in");
      _googleSignIn.signIn();
      print("sign in atttempted");
      print((await _googleSignIn.currentUser.authentication).accessToken);
      if (await _googleSignIn.isSignedIn()){
        // navigate to main
        //Navigator.of(context).popAndPushNamed('/main');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(SocialIcons.facebook_circled,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(4.0), // decrease padding to keep alignment
          onPressed: () async {
            print("Faceboook pushed");
            final FacebookLogin _login = FacebookLogin();
            final result = await _login.logInWithReadPermissions(['email']);

            switch (result.status){
              case FacebookLoginStatus.loggedIn:
                print(result.accessToken);
                break;
              case FacebookLoginStatus.cancelledByUser:
                print('cancelled');
                break;
              case FacebookLoginStatus.error:
                print(result.errorMessage);
                break;
            }
          },
          iconSize: buttonSize,
        ),
        Container(width: 20,),
        IconButton(
          icon: Icon(SocialIcons.google_plus_circle,
            color:  Colors.white,
          ),
          padding: EdgeInsets.all(4.0), // decrease padding to keep alignment
          onPressed: () => _signInGoogle(context),
          iconSize: buttonSize,
        ),
      ],
    );
  }
}