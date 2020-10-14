// import 'package:beer_app/configuration/theme.dart';
import 'package:beer_app/configuration/themev2.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeV2.light, //ThemeConf.light,
      darkTheme: ThemeV2.dark,
      themeMode: ThemeMode.light,
      home: HomePage(),
    );
  }
}
