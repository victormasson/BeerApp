class FavoriteBeer {
  final int id;
  final int idBeer;
  final String nameBeer;

  FavoriteBeer({this.id, this.idBeer, this.nameBeer});

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnIdBeer: idBeer,
      columnNameBeer: nameBeer,
    };
  }

  static String get tableName => (FavoriteBeer).toString();
  static String get columnId => 'id';
  static String get columnIdBeer => 'idBeer';
  static String get columnNameBeer => 'nameBeer';
  static String get queryCreationTable =>
      """CREATE TABLE ${FavoriteBeer.tableName}(
          ${FavoriteBeer.columnId} INTEGER PRIMARY KEY,
          ${FavoriteBeer.columnIdBeer} INTEGER NOT NULL UNIQUE,
          ${FavoriteBeer.columnNameBeer} TEXT NOT NULL
      );""";
}
