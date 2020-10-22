import 'package:beer_app/models/favorite_beer.dart';
import 'package:beer_app/database/db_context.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class FavoriteBeerDal {
  static Future<void> insert(FavoriteBeer favoriteBeer) async {
    final Database db = await DbContext.openDb();
    await db.insert(
      FavoriteBeer.tableName,
      favoriteBeer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<FavoriteBeer>> all() async {
    final Database db = await DbContext.openDb();

    final List<Map<String, dynamic>> maps =
        await db.query(FavoriteBeer.tableName);

    return List.generate(
        maps.length,
        (i) => FavoriteBeer(
              id: maps[i][FavoriteBeer.columnId],
              idBeer: maps[i][FavoriteBeer.columnIdBeer],
              nameBeer: maps[i][FavoriteBeer.columnNameBeer],
            ));
  }

  static Future<FavoriteBeer> getById(int id) async {
    final Database db = await DbContext.openDb();

    final List<Map<String, dynamic>> maps = await db.query(
      FavoriteBeer.tableName,
      where: "${FavoriteBeer.columnId} = ?",
      whereArgs: [id],
    );

    return List.generate(
        maps.length,
        (i) => FavoriteBeer(
              id: maps[i][FavoriteBeer.columnId],
              idBeer: maps[i][FavoriteBeer.columnIdBeer],
              nameBeer: maps[i][FavoriteBeer.columnNameBeer],
            ))[0];
  }

  static Future<FavoriteBeer> getByIdBeer(int idBeer) async {
    final Database db = await DbContext.openDb();

    final List<Map<String, dynamic>> maps = await db.query(
      FavoriteBeer.tableName,
      where: "${FavoriteBeer.columnIdBeer} = ?",
      whereArgs: [idBeer],
    );

    return List.generate(
        maps.length,
        (i) => FavoriteBeer(
              id: maps[i][FavoriteBeer.columnId],
              idBeer: maps[i][FavoriteBeer.columnIdBeer],
              nameBeer: maps[i][FavoriteBeer.columnNameBeer],
            ))[0];
  }

  static Future<int> update(FavoriteBeer favoriteBeer) async {
    final db = await DbContext.openDb();

    return await db.update(
      FavoriteBeer.tableName,
      favoriteBeer.toMap(),
      where: "${FavoriteBeer.columnId} = ?",
      whereArgs: [favoriteBeer.id],
    );
  }

  static Future<void> delete(int id) async {
    final db = await DbContext.openDb();

    await db.delete(
      FavoriteBeer.tableName,
      where: "${FavoriteBeer.columnId} = ?",
      whereArgs: [id],
    );
  }
}
