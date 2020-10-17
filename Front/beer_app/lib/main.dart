import 'package:beer_app/configuration/app_builder.dart';
import 'package:beer_app/configuration/routes.dart';
import 'package:beer_app/configuration/themes.dart';
import 'package:beer_app/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initStore();
    return BeerApp();
  }
}

class BeerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBuilder(builder: (context) {
      return Observer(
          builder: (_) => MaterialApp(
                title: 'Flutter Demo',
                theme: Themes.light,
                darkTheme: Themes.dark,
                themeMode: StoreApp.globalStore.globalSetting.themeMode,
                routes: routes,
                initialRoute: '/',
              ));
    });
  }
}
