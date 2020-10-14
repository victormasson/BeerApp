import 'dart:convert';
import 'package:beer_app/models/beer.dart';
import 'package:beer_app/services/api.dart';
import 'package:flutter/widgets.dart';

class BeerService {
  String url = "beers";

  BeerService();

  Future<List<Beer>> getAll({int page = 1, int perPage = 72}) async {
    if (perPage > 80) {
      perPage = 80;
    }
    final res = await Api.get(
        url + "?page=${page.toString()}&per_page=${perPage.toString()}");
    if (res.statusCode != 200) {
      debugPrint("error: " + res.body);
    }
    List<dynamic> val = json.decode(res.body);
    if (val.length != 0) {
      final listeItem = val.map((f) => Beer.fromJson(f)).toList();
      return listeItem;
    }
    return new List<Beer>();
  }
}
