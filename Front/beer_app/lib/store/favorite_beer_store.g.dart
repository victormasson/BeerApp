// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_beer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteBeerStore on _FavoriteBeerStore, Store {
  final _$listFavoriteBeerAtom =
      Atom(name: '_FavoriteBeerStore.listFavoriteBeer');

  @override
  List<FavoriteBeer> get listFavoriteBeer {
    _$listFavoriteBeerAtom.reportRead();
    return super.listFavoriteBeer;
  }

  @override
  set listFavoriteBeer(List<FavoriteBeer> value) {
    _$listFavoriteBeerAtom.reportWrite(value, super.listFavoriteBeer, () {
      super.listFavoriteBeer = value;
    });
  }

  final _$addFavoriteBeerAsyncAction =
      AsyncAction('_FavoriteBeerStore.addFavoriteBeer');

  @override
  Future<void> addFavoriteBeer({int idBeer, String name}) {
    return _$addFavoriteBeerAsyncAction
        .run(() => super.addFavoriteBeer(idBeer: idBeer, name: name));
  }

  final _$removeFavoriteBeerAsyncAction =
      AsyncAction('_FavoriteBeerStore.removeFavoriteBeer');

  @override
  Future<void> removeFavoriteBeer({int idBeer}) {
    return _$removeFavoriteBeerAsyncAction
        .run(() => super.removeFavoriteBeer(idBeer: idBeer));
  }

  final _$getAllFavoriteBeerAsyncAction =
      AsyncAction('_FavoriteBeerStore.getAllFavoriteBeer');

  @override
  Future<void> getAllFavoriteBeer() {
    return _$getAllFavoriteBeerAsyncAction
        .run(() => super.getAllFavoriteBeer());
  }

  @override
  String toString() {
    return '''
listFavoriteBeer: ${listFavoriteBeer}
    ''';
  }
}
