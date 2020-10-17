import 'package:beer_app/pages/beer_page.dart';
import 'package:beer_app/pages/home_page.dart';
import 'package:beer_app/pages/setting_page.dart';

var routes = {
  RoutesName.home: (context) => HomePage(),
  RoutesName.beer: (context) => BeerPage(),
  RoutesName.settings: (context) => SettingPage(),
};

class RoutesName {
  static String home = '/';
  static String beer = '/beer';
  static String settings = '/settings';
}
