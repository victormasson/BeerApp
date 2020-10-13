import 'dart:convert';
import 'package:beer_app/models/beer.dart';
import 'package:beer_app/services/api.dart';
import 'package:flutter/widgets.dart';

class BeerService {
  String url = "beers";

  BeerService();

  Future<List<Beer>> getAll() async {
    try {
      final res = await Api.get(url + "?page=1&per_page=20");
      if (res.statusCode != 200) {
        debugPrint("error: " + res.body);
      }
      List<dynamic> val = json.decode(res.body);
      if (val.length != 0) {
        final listeItem = val.map((f) => Beer.fromJson(f)).toList();
        return listeItem;
      }
      return new List<Beer>();
    } catch (e) {
      debugPrint(e);
      return null;
    }
  }
}
