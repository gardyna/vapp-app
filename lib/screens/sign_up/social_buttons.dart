import 'package:flutter/material.dart';
import 'package:vapp/Presentation/social_icons_icons.dart';

class SocialButtons extends StatelessWidget {
  final double buttonSize;

  const SocialButtons({
    Key key,
    this.buttonSize,
  }) : super(key: key);

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
          onPressed: (){
            print("Faceboook pushed");
          },
          iconSize: buttonSize,
        ),
        Container(width: 20,),
        IconButton(
          icon: Icon(SocialIcons.google_plus_circle,
            color:  Colors.white,
          ),
          onPressed: (){
            print("Google Pushed");
          },
          iconSize: buttonSize,
        ),
      ],
    );
  }
}