import 'dart:io';

import 'package:beer_app/configuration/settings.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api {
  static Map<String, String> getHeader() {
    return {
      // HttpHeaders.authorizationHeader: "bearer " + token,
      HttpHeaders.contentTypeHeader: "application/json"
    };
  }

  static String concatUrl(String url) {
    return Settings.urlApiAll + url;
  }

  static Future<Response> get(String url) async {
    final u = concatUrl(url);
    final header = getHeader();
    return await http.get(u, headers: header);
  }

  static Future<Response> post(String url, dynamic body) async {
    final u = concatUrl(url);
    final h = getHeader();
    return await http.post(u, body: body, headers: h);
  }

  static Future<Response> put(String url, dynamic body) async {
    final u = concatUrl(url);
    final h = getHeader();
    return await http.put(u, body: body, headers: h);
  }

  static Future<Response> delete(String url) async {
    final u = concatUrl(url);
    final h = getHeader();
    return await http.delete(u, headers: h);
  }
}
