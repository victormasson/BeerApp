import 'package:beer_app/configuration/routes.dart';
import 'package:beer_app/models/beer.dart';
import 'package:beer_app/store/store.dart';
import 'package:beer_app/utils/string_utils.dart';
import 'package:beer_app/utils/notification_text.dart';
import 'package:beer_app/widgets/home_page/home_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListBeerWidget extends StatefulWidget {
  @override
  _ListBeerWidgetState createState() => _ListBeerWidgetState();
}

class _ListBeerWidgetState extends State<ListBeerWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await StoreApp.favoriteBeerStore.getAllFavoriteBeer();
    await StoreApp.beerStore.loadBeer(reloadData: true);
  }

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
  }

  Widget getSearch() {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Container(
        decoration: new BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.all(1),
              tooltip: 'Show menu',
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(RoutesName.drawer.icon),
            ),
            Expanded(
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
                  hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.background),
                ),
                style: Theme.of(context).textTheme.bodyText2,
                onChanged: (query) => updateSearchQuery(query),
                onSubmitted: (String query) => startSearch(query),
              ),
            ),
            HomeMenuWidget(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => StoreApp.beerStore.isLoadingPage
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.fromLTRB(0, 65, 0, 0),
                child: Column(
                  children: [
                    getSearch(),
                    Expanded(
                        child: ListView.builder(
                      itemCount: StoreApp.beerStore.getListBeer.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Beer beer = StoreApp.beerStore.getListBeer[index];

                        return Observer(
                          builder: (_) => Slidable(
                            closeOnScroll: true,
                            movementDuration: Duration(milliseconds: 500),
                            // enabled: true,
                            direction: Axis.horizontal,
                            actionExtentRatio: 0.25,
                            actions: <Widget>[
                              new IconSlideAction(
                                caption: StoreApp.favoriteBeerStore
                                        .isFavoriteBeer(beer.id)
                                    ? 'Remove from favorite'
                                    : 'Add to favorite',
                                color: Colors.blue,
                                icon: StoreApp.favoriteBeerStore
                                        .isFavoriteBeer(beer.id)
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                onTap: () {
                                  if (StoreApp.favoriteBeerStore
                                      .isFavoriteBeer(beer.id)) {
                                    StoreApp.favoriteBeerStore
                                        .removeFavoriteBeer(idBeer: beer.id);
                                    NotificationText.showSnackBar(
                                        context: context,
                                        text:
                                            'Remove ${beer.name} from favorite');
                                  } else {
                                    StoreApp.favoriteBeerStore.addFavoriteBeer(
                                        idBeer: beer.id, name: beer.name);
                                    NotificationText.showSnackBar(
                                        context: context,
                                        text: 'Add ${beer.name} to favorite');
                                  }
                                },
                              ),
                            ],
                            actionPane: SlidableDrawerActionPane(),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: beer.imageUrl == null
                                    ? Text(transformStringInitials(
                                        title: beer.name, maxlength: 2))
                                    : Image(image: NetworkImage(beer.imageUrl)),
                              ),
                              title: Text(beer.name),
                              subtitle: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                Navigator.pushNamed(
                                    context, RoutesName.beer.path,
                                    arguments: beer.id);
                              },
                            ),
                          ),
                        );
                      },
                    )),
                  ],
                ),
              ));
  }
}
