import 'dart:ui';

import 'package:flutter/material.dart';

class ThemeConf {
  static ThemeData get light {
    return ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        highlightColor: Colors.lime[400],

        // Define the default font family.
        // fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
          headline6: TextStyle(
              fontSize: 36.0,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.none),
          bodyText1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none),
          bodyText2: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.none,
          ),
        ));
  }
}
