import 'package:beer_app/widgets/setting_widget.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Settings',
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
      ),
      body: SettingWidget(),
    );
  }
}
