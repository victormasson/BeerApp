// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BeerStore on _BeerStore, Store {
  Computed<List<Beer>> _$getSortedListBeerComputed;

  @override
  List<Beer> get getSortedListBeer => (_$getSortedListBeerComputed ??=
          Computed<List<Beer>>(() => super.getSortedListBeer,
              name: '_BeerStore.getSortedListBeer'))
      .value;
  Computed<List<Beer>> _$getListBeerWithQueryComputed;

  @override
  List<Beer> get getListBeerWithQuery => (_$getListBeerWithQueryComputed ??=
          Computed<List<Beer>>(() => super.getListBeerWithQuery,
              name: '_BeerStore.getListBeerWithQuery'))
      .value;

  final _$getBeerAtom = Atom(name: '_BeerStore.getBeer');

  @override
  Beer get getBeer {
    _$getBeerAtom.reportRead();
    return super.getBeer;
  }

  @override
  set getBeer(Beer value) {
    _$getBeerAtom.reportWrite(value, super.getBeer, () {
      super.getBeer = value;
    });
  }

  final _$getListBeerAtom = Atom(name: '_BeerStore.getListBeer');

  @override
  List<Beer> get getListBeer {
    _$getListBeerAtom.reportRead();
    return super.getListBeer;
  }

  @override
  set getListBeer(List<Beer> value) {
    _$getListBeerAtom.reportWrite(value, super.getListBeer, () {
      super.getListBeer = value;
    });
  }

  final _$isLoadingPageAtom = Atom(name: '_BeerStore.isLoadingPage');

  @override
  bool get isLoadingPage {
    _$isLoadingPageAtom.reportRead();
    return super.isLoadingPage;
  }

  @override
  set isLoadingPage(bool value) {
    _$isLoadingPageAtom.reportWrite(value, super.isLoadingPage, () {
      super.isLoadingPage = value;
    });
  }

  final _$isWaitingPageAtom = Atom(name: '_BeerStore.isWaitingPage');

  @override
  bool get isWaitingPage {
    _$isWaitingPageAtom.reportRead();
    return super.isWaitingPage;
  }

  @override
  set isWaitingPage(bool value) {
    _$isWaitingPageAtom.reportWrite(value, super.isWaitingPage, () {
      super.isWaitingPage = value;
    });
  }

  final _$getActionCurrentPageAtom =
      Atom(name: '_BeerStore.getActionCurrentPage');

  @override
  ActionCurrentPage get getActionCurrentPage {
    _$getActionCurrentPageAtom.reportRead();
    return super.getActionCurrentPage;
  }

  @override
  set getActionCurrentPage(ActionCurrentPage value) {
    _$getActionCurrentPageAtom.reportWrite(value, super.getActionCurrentPage,
        () {
      super.getActionCurrentPage = value;
    });
  }

  final _$getActionSortListAtom = Atom(name: '_BeerStore.getActionSortList');

  @override
  ActionSortList get getActionSortList {
    _$getActionSortListAtom.reportRead();
    return super.getActionSortList;
  }

  @override
  set getActionSortList(ActionSortList value) {
    _$getActionSortListAtom.reportWrite(value, super.getActionSortList, () {
      super.getActionSortList = value;
    });
  }

  final _$getQueryAtom = Atom(name: '_BeerStore.getQuery');

  @override
  String get getQuery {
    _$getQueryAtom.reportRead();
    return super.getQuery;
  }

  @override
  set getQuery(String value) {
    _$getQueryAtom.reportWrite(value, super.getQuery, () {
      super.getQuery = value;
    });
  }

  final _$getRowsPerPageAtom = Atom(name: '_BeerStore.getRowsPerPage');

  @override
  int get getRowsPerPage {
    _$getRowsPerPageAtom.reportRead();
    return super.getRowsPerPage;
  }

  @override
  set getRowsPerPage(int value) {
    _$getRowsPerPageAtom.reportWrite(value, super.getRowsPerPage, () {
      super.getRowsPerPage = value;
    });
  }

  final _$getCurrentPageAtom = Atom(name: '_BeerStore.getCurrentPage');

  @override
  int get getCurrentPage {
    _$getCurrentPageAtom.reportRead();
    return super.getCurrentPage;
  }

  @override
  set getCurrentPage(int value) {
    _$getCurrentPageAtom.reportWrite(value, super.getCurrentPage, () {
      super.getCurrentPage = value;
    });
  }

  final _$fethListBeerAsyncAction = AsyncAction('_BeerStore.fethListBeer');

  @override
  Future<String> fethListBeer({@required int page, @required int perPage}) {
    return _$fethListBeerAsyncAction
        .run(() => super.fethListBeer(page: page, perPage: perPage));
  }

  final _$_BeerStoreActionController = ActionController(name: '_BeerStore');

  @override
  void incrementCurrentPage() {
    final _$actionInfo = _$_BeerStoreActionController.startAction(
        name: '_BeerStore.incrementCurrentPage');
    try {
      return super.incrementCurrentPage();
    } finally {
      _$_BeerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementCurrentPage() {
    final _$actionInfo = _$_BeerStoreActionController.startAction(
        name: '_BeerStore.decrementCurrentPage');
    try {
      return super.decrementCurrentPage();
    } finally {
      _$_BeerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getBeer: ${getBeer},
getListBeer: ${getListBeer},
isLoadingPage: ${isLoadingPage},
isWaitingPage: ${isWaitingPage},
getActionCurrentPage: ${getActionCurrentPage},
getActionSortList: ${getActionSortList},
getQuery: ${getQuery},
getRowsPerPage: ${getRowsPerPage},
getCurrentPage: ${getCurrentPage},
getSortedListBeer: ${getSortedListBeer},
getListBeerWithQuery: ${getListBeerWithQuery}
    ''';
  }
}
