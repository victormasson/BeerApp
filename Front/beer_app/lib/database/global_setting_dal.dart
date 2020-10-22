import 'package:beer_app/database/db_context.dart';
import 'package:beer_app/models/global_setting.dart';
import 'package:sqflite/sqflite.dart';

class GlobalSettingDal {
  static Future<void> insert(GlobalSetting globalSetting) async {
    final Database db = await DbContext.openDb();
    await db.insert(
      GlobalSetting.tableName,
      globalSetting.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<GlobalSetting>> all() async {
    final Database db = await DbContext.openDb();

    final List<Map<String, dynamic>> maps =
        await db.query(GlobalSetting.tableName);

    return List.generate(
        maps.length,
        (i) => GlobalSetting(
              id: maps[i][GlobalSetting.columnId],
              themeModeString: maps[i][GlobalSetting.columnThemeMode],
            ));
  }

  static Future<GlobalSetting> getById(int id) async {
    final Database db = await DbContext.openDb();

    final List<Map<String, dynamic>> maps = await db.query(
      GlobalSetting.tableName,
      where: "${GlobalSetting.columnId} = ?",
      whereArgs: [id],
    );

    return List.generate(
        maps.length,
        (i) => GlobalSetting(
              id: maps[i][GlobalSetting.columnId],
              themeModeString: maps[i][GlobalSetting.columnThemeMode],
            ))[0];
  }

  static Future<int> update(GlobalSetting globalSetting) async {
    final db = await DbContext.openDb();

    return await db.update(
      GlobalSetting.tableName,
      globalSetting.toMap(),
      where: "${GlobalSetting.columnId} = ?",
      whereArgs: [globalSetting.id],
    );
  }
}
