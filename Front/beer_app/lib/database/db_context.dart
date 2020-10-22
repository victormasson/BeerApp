import 'package:beer_app/configuration/settings.dart';
import 'package:beer_app/models/favorite_beer.dart';
import 'package:beer_app/models/global_setting.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class DatabaseInititalization {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await openDatabase(
      join(await getDatabasesPath(), Settings.databaseName),
      version: Settings.databaseVersion,
      onCreate: (db, version) {
        for (var i = 1; i <= version; i++) {
          switch (i) {
            case 1:
              _version1(db);
              break;
            default:
          }
        }
      },
    );
  }

  static Future<void> _version1(Database db) async {
    db.execute(FavoriteBeer.queryCreationTable);
    db.execute(GlobalSetting.queryCreationTable);

    db.execute(GlobalSetting.queryInsertTable);
  }
}

class DbContext {
  static Future<Database> openDb() async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), Settings.databaseName),
    );

    return database;
  }
}
