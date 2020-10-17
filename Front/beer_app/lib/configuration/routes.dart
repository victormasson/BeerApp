import 'package:beer_app/pages/beer_page.dart';
import 'package:beer_app/pages/home_page.dart';
import 'package:beer_app/pages/setting_page.dart';
import 'package:flutter/material.dart';

final routes = {
  RoutesName.home.path: (context) => HomePage(),
  RoutesName.beer.path: (context) => BeerPage(),
  RoutesName.settings.path: (context) => SettingPage(),
};

class RoutesName {
  static final RouteTitle home = RouteTitle(path: '/', title: 'Home');
  static final RouteTitle beer = RouteTitle(path: '/beer', title: 'Beer');
  static final RouteTitle settings = RouteTitle(
      path: '/settings',
      icon: Icons.settings_applications_outlined,
      title: 'Settings');
  static final RouteTitle drawer =
      RouteTitle(path: '/drawer', title: 'Menu', icon: Icons.menu_outlined);
}

class RouteTitle {
  final String title;
  final IconData icon;
  final String path;

  RouteTitle({this.title, this.path, this.icon});
}
