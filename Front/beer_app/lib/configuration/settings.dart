import 'package:flutter/widgets.dart';

class Settings {
  static String get urlApiAll => 'https://api.punkapi.com/v2/';

  static double getHeight(context) => MediaQuery.of(context).size.height;

  static double getWidth(context) => MediaQuery.of(context).size.width;

  static String get databaseName => 'punkbeer.db';
  static int get databaseVersion => 1;
}
