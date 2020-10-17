import 'package:beer_app/configuration/routes.dart';
import 'package:flutter/material.dart';

class HomeMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String result) {
        if (RoutesName.drawer.title == result) {
          Scaffold.of(context).openDrawer();
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: RoutesName.drawer.title,
          child: Icon(RoutesName.drawer.icon),
        ),
      ],
    );
  }
}
