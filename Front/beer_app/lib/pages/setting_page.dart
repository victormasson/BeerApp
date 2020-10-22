import 'package:beer_app/widgets/setting_widget.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Settings'),
      ),
      body: SettingWidget(),
    );
  }
}
