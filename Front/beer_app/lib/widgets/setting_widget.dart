import 'package:flutter/material.dart';
import 'package:beer_app/store/store.dart';

class SettingWidget extends StatefulWidget {
  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  ThemeMode _themMode = StoreApp.globalStore.globalSetting.getThemeMode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> getThemeMode() {
      return [
        ListTile(
          title: const Text('dark'),
          leading: Radio(
            value: ThemeMode.dark,
            groupValue: _themMode,
            onChanged: (ThemeMode value) {
              setState(() {
                _themMode = value;
              });
              StoreApp.globalStore.setThemeMode(value, context);
            },
          ),
        ),
        ListTile(
          title: const Text('light'),
          leading: Radio(
            value: ThemeMode.light,
            groupValue: _themMode,
            onChanged: (ThemeMode value) {
              setState(() {
                _themMode = value;
              });
              StoreApp.globalStore.setThemeMode(value, context);
            },
          ),
        ),
        ListTile(
          title: const Text('system'),
          leading: Radio(
            value: ThemeMode.system,
            groupValue: _themMode,
            onChanged: (ThemeMode value) {
              setState(() {
                _themMode = value;
              });
              StoreApp.globalStore.setThemeMode(value, context);
            },
          ),
        ),
      ];
    }

    return Container(
      child: Column(
        children: [
          ExpansionTile(
            title: Text(
              "Theme Mode",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            initiallyExpanded: true,
            children: getThemeMode(),
          ),
        ],
      ),
    );
  }
}
