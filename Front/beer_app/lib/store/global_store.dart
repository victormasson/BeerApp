import 'package:beer_app/configuration/app_builder.dart';
import 'package:beer_app/models/global_setting.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'global_store.g.dart';

// This is the class used by rest of your codebase
class GlobalStore = _GlobalStore with _$GlobalStore;

// The store-class
abstract class _GlobalStore with Store {
  @observable
  GlobalSetting globalSetting = new GlobalSetting(themeMode: ThemeMode.light);

  @action
  void setThemeMode(ThemeMode themeMode, BuildContext context) {
    this.globalSetting.themeMode = themeMode;
    AppBuilder.of(context).rebuild();
  }
}
