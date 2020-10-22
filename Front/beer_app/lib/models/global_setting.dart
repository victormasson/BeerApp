import 'package:flutter/material.dart';

class GlobalSetting {
  int id;
  String themeMode;

  ThemeMode get getThemeMode {
    switch (themeMode) {
      case 'dark':
        return ThemeMode.dark;
        break;
      case 'light':
        return ThemeMode.light;
        break;
      case 'system':
        return ThemeMode.system;
        break;
      default:
        return ThemeMode.light;
    }
  }

  set setThemeMode(ThemeMode themeModeValue) {
    switch (themeModeValue) {
      case ThemeMode.dark:
        themeMode = 'dark';
        break;
      case ThemeMode.light:
        themeMode = 'light';
        break;
      case ThemeMode.system:
        themeMode = 'system';
        break;
      default:
        themeMode = 'light';
    }
  }

  GlobalSetting({int id, ThemeMode themeMode, String themeModeString}) {
    if (themeMode != null && themeModeString != null) {
      throw '(themeMode != null && themeModeString != null) Only one can be set.';
    }
    this.id = id;
    if (themeMode != null) {
      this.setThemeMode = themeMode;
    }
    if (themeModeString != null) {
      this.themeMode = themeModeString;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnThemeMode: themeMode,
    };
  }

  static String get tableName => (GlobalSetting).toString();
  static String get columnId => 'id';
  static String get columnThemeMode => 'themeMode';
  static String get queryCreationTable =>
      """CREATE TABLE ${GlobalSetting.tableName}(
          ${GlobalSetting.columnId} INTEGER PRIMARY KEY,
          ${GlobalSetting.columnThemeMode} TEXT NOT NULL
      );
      """;

  static String get queryInsertTable =>
      """INSERT INTO ${GlobalSetting.tableName}
      (${GlobalSetting.columnId}, ${GlobalSetting.columnThemeMode})
      VALUES
      (1, 'system');""";
}
