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
      children: <Widget>[
        IconButton(
          icon: Icon(SocialIcons.facebook_circled,
            color: Colors.white,
            size: buttonSize,
          ),
          onPressed: (){
            print("Faceboook pushed");
          },
        ),
        Container(width: 30,),
        IconButton(
          icon: Icon(SocialIcons.google_plus_circle,
            color:  Colors.white,
            size: buttonSize,
          ),
          onPressed: (){
            print("Google Pushed");
          },
        ),
      ],
    );
  }
}