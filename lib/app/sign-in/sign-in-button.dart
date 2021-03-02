import 'dart:ffi';

import 'package:andreApp/common-widgets/custom-raised-button.dart';
import 'package:flutter/material.dart';

class SignInButtom extends CustomRaisedButton {
  SignInButtom(
      {String text, Color color, Color textColor, VoidCallback onPressed})
      : super(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 18.0,
              ),
            ),
            color: color,
            onPressed: onPressed);
}
