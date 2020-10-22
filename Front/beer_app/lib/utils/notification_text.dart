import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class NotificationText {
  static void showSnackBar({BuildContext context, String text = ''}) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
    ));
  }

  static void showToast({BuildContext context, String text}) {
    String t = text;
    if (t == null) {
      return;
    }

    Toast.show(t, context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM,
        textColor: Colors.white,
        backgroundColor: Color(0xAA000000));
  }
}
