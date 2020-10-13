import 'package:flutter/widgets.dart';

class Settings {
  static get urlApi {
    return "https://api.punkapi.com/v2/";
  }

  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}
