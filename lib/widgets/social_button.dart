import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.radius,
      required this.buttonIcon,
      required this.onPressed});
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final Widget buttonIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all<Color>(buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ))),
        onPressed:onPressed,
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            buttonIcon,
            Text(buttonText,style:TextStyle(color:textColor),),
            Opacity(
              opacity:0,
              child: buttonIcon)
          ],
        )
        );
  }
}
