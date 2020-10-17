import 'package:beer_app/configuration/routes.dart';
import 'package:beer_app/models/beer.dart';
import 'package:beer_app/store/beer_store.dart';
import 'package:beer_app/store/store.dart';
import 'package:beer_app/utils/enums.dart';
import 'package:beer_app/utils/string_utils.dart';
import 'package:beer_app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ListBeerWidget extends StatefulWidget {
  @override
  _ListBeerWidgetState createState() => _ListBeerWidgetState();
}

class _ListBeerWidgetState extends State<ListBeerWidget> {
  List<Beer> listBeer;
  int _rowsPerPage = 10;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    StoreApp.beerStore.isLoadingPage = true;
    StoreApp.beerStore.isWaitingPage = false;
    StoreApp.beerStore.setActionCurrentPage =
        StoreApp.beerStore.getCurrentPage == 1
            ? ActionCurrentPage.dec
            : ActionCurrentPage.all;
  }

  init() async {
    StoreApp.beerStore.isWaitingPage = true;
    setState(() {
      this._rowsPerPage = StoreApp.beerStore.getRowsPerPage;
      this._currentPage = StoreApp.beerStore.getCurrentPage;
    });
    var err = await fethListBeer(page: _currentPage, perPage: _rowsPerPage);
    if (err != '') {
      showToast(context: context, text: err);
    }

    StoreApp.beerStore.setActionCurrentPage = _currentPage == 1
        ? ActionCurrentPage.inc
        : _currentPage > 1 &&
                StoreApp.beerStore.getListBeer.length != _rowsPerPage
            ? ActionCurrentPage.dec
            : ActionCurrentPage.all;
    setState(() {
      listBeer = getListBeer();
    });
    StoreApp.beerStore.setIsLoadingPage = false;
    StoreApp.beerStore.isWaitingPage = false;
  }

  List<Beer> getListBeer() {
    return StoreApp.beerStore.getQuery != ''
        ? StoreApp.beerStore.getListBeerWithQuery
        : StoreApp.beerStore.getSortedListBeer;
  }

  Future<String> fethListBeer(
      {@required int page, @required int perPage}) async {
    return StoreApp.beerStore.fethListBeer(page: page, perPage: perPage);
  }

  bool get conditionDisplay =>
      !StoreApp.beerStore.isLoadingPage &&
      _currentPage == StoreApp.beerStore.getCurrentPage &&
      _rowsPerPage == StoreApp.beerStore.getRowsPerPage;

  bool get conditionSearch =>
      !StoreApp.beerStore.isWaitingPage &&
      (StoreApp.beerStore.isLoadingPage ||
          _currentPage != StoreApp.beerStore.getCurrentPage ||
          _rowsPerPage != StoreApp.beerStore.getRowsPerPage);

  TextEditingController _searchQueryController = TextEditingController();
  String searchQuery = "Search query";
  bool showCursor = false;

  void updateSearchQuery(String newQuery) {
    setState(() {
      if (newQuery == '') {
        showCursor = false;
      } else {
        showCursor = true;
      }
      searchQuery = newQuery;
    });
  }

  void startSearch(String query) {
    StoreApp.beerStore.setQuery = query;
    StoreApp.beerStore.setIsLoadingPage = true;
  }

  Widget getSearch() {
    return Container(
      padding: EdgeInsets.all(12),
      child: TextField(
        controller: _searchQueryController,
        autofocus: false,
        showCursor: this.showCursor,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: "Search Data...",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search,
              color: Theme.of(context).colorScheme.secondary),
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.background),
        ),
        style: Theme.of(context).textTheme.bodyText2,
        onChanged: (query) => updateSearchQuery(query),
        onSubmitted: (String query) => startSearch(query),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    when((_) => conditionSearch,
        () => Future.delayed(Duration(milliseconds: 50), () => init()));

    return Observer(
        builder: (_) => StoreApp.beerStore.isLoadingPage
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: Column(
                  children: [
                    getSearch(),
                    Expanded(
                        child: ListView.builder(
                      itemCount: this.listBeer.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Beer beer = this.listBeer[index];

                        return ListTile(
                          leading: CircleAvatar(
                            child: beer.imageUrl == null
                                ? Text(transformStringInitials(
                                    title: beer.name, maxlength: 2))
                                : Image(image: NetworkImage(beer.imageUrl)),
                          ),
                          title: Text(beer.name),
                          subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: Text(beer.tagline)),
                              Text(
                                beer.abv.toString(),
                                style: TextStyle(
                                  color: Theme.of(context).highlightColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  backgroundColor: Colors.transparent,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            StoreApp.beerStore.setBeer = beer;
                            Navigator.pushNamed(context, RoutesName.beer);
                          },
                        );
                      },
                    )),
                  ],
                ),
              ));
  }
}
