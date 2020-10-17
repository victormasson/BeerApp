import 'package:beer_app/models/beer.dart';
import 'package:beer_app/services/beer_service.dart';
import 'package:beer_app/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'beer_store.g.dart';

// This is the class used by rest of your codebase
class BeerStore = _BeerStore with _$BeerStore;

// The store-class
abstract class _BeerStore with Store {
  @observable
  Beer getBeer = new Beer();

  @observable
  List<Beer> getListBeer = new List<Beer>();

  @observable
  bool isLoadingPage = true;
  set setIsLoadingPage(bool isLoadingPage) {
    this.isLoadingPage = isLoadingPage;
  }

  @observable
  bool isWaitingPage = true;
  set setIsWaitingPage(bool isWaitingPage) {
    this.isWaitingPage = isWaitingPage;
  }

  @observable
  ActionCurrentPage getActionCurrentPage = ActionCurrentPage.inc;
  set setActionCurrentPage(ActionCurrentPage actionCurrentPage) {
    this.getActionCurrentPage = actionCurrentPage;
  }

  @observable
  ActionSortList getActionSortList = ActionSortList.asc;
  set setActionSortList(ActionSortList actionSortList) {
    this.getActionSortList = actionSortList;
  }

  @computed
  List<Beer> get getSortedListBeer {
    var listBeer = this.getListBeer;
    switch (this.getActionSortList) {
      case ActionSortList.asc:
        listBeer.sort((a, b) => a.name.compareTo(b.name));
        break;
      case ActionSortList.desc:
        listBeer.sort((a, b) => b.name.compareTo(a.name));
        break;
      default:
    }
    return listBeer;
  }

  @observable
  String getQuery = '';
  set setQuery(String newValue) {
    this.getQuery = newValue;
  }

  @computed
  List<Beer> get getListBeerWithQuery {
    List<Beer> listBeer = this.getSortedListBeer;
    return listBeer
        .where((Beer element) =>
            element.firstBrewed
                .toString()
                .toLowerCase()
                .contains(getQuery.toLowerCase()) ||
            element.description
                .toLowerCase()
                .contains(getQuery.toLowerCase()) ||
            element.abv
                .toString()
                .toLowerCase()
                .contains(getQuery.toLowerCase()) ||
            element.tagline.toLowerCase().contains(getQuery.toLowerCase()) ||
            element.ibu
                .toString()
                .toLowerCase()
                .contains(getQuery.toLowerCase()) ||
            element.volume.value
                .toString()
                .toLowerCase()
                .contains(getQuery.toLowerCase()) ||
            element.volume.unit
                .toLowerCase()
                .contains(getQuery.toLowerCase()) ||
            element.contributedBy
                .toLowerCase()
                .contains(getQuery.toLowerCase()) ||
            element.brewersTips
                .toLowerCase()
                .contains(getQuery.toLowerCase()) ||
            element.name.toLowerCase().contains(getQuery.toLowerCase()))
        .toList();
  }

  @observable
  int getRowsPerPage = 10;
  set setRowsPerPage(int rowsPerPage) {
    this.getRowsPerPage = rowsPerPage;
  }

  @observable
  int getCurrentPage = 1;
  set setCurrentPage(int currentPage) {
    this.getCurrentPage = currentPage;
  }

  @action
  void incrementCurrentPage() {
    this.setCurrentPage = this.getCurrentPage + 1;
  }

  @action
  void decrementCurrentPage() {
    this.setCurrentPage = this.getCurrentPage - 1;
  }

  set setBeer(Beer beer) {
    this.getBeer = beer;
  }

  set setListBeer(List<Beer> listBeer) {
    this.getListBeer = listBeer;
  }

  @action
  Future<String> fethListBeer(
      {@required int page, @required int perPage}) async {
    try {
      List<Beer> listBeer =
          await BeerService.getAll(page: page, perPage: perPage);
      this.setListBeer = listBeer;
      return '';
    } catch (e) {
      return e.message;
    }
  }
}
