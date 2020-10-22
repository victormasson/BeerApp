import 'package:beer_app/configuration/routes.dart';
import 'package:beer_app/models/favorite_beer.dart';
import 'package:beer_app/store/store.dart';
import 'package:beer_app/utils/notification_text.dart';
import 'package:beer_app/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FavoriteBeerPage extends StatefulWidget {
  @override
  _FavoriteBeerPageState createState() => _FavoriteBeerPageState();
}

class _FavoriteBeerPageState extends State<FavoriteBeerPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await StoreApp.favoriteBeerStore.getAllFavoriteBeer();
    setState(() {
      this.isLoading = false;
    });
  }

  Widget getFav() {
    return Observer(
        builder: (_) => ListView.builder(
            itemCount: StoreApp.favoriteBeerStore.listFavoriteBeer.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              FavoriteBeer favoriteBeer =
                  StoreApp.favoriteBeerStore.listFavoriteBeer[index];

              return Dismissible(
                  // Each Dismissible must contain a Key. Keys allow Flutter to
                  // uniquely identify widgets.
                  background: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Remove',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      color: Colors.red),
                  key: Key(favoriteBeer.id.toString()),
                  // Provide a function that tells the app
                  // what to do after an item has been swiped away.
                  onDismissed: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      StoreApp.favoriteBeerStore.listFavoriteBeer.removeWhere(
                          (element) => element.id == favoriteBeer.id);

                      await StoreApp.favoriteBeerStore
                          .removeFavoriteBeer(idBeer: favoriteBeer.idBeer);

                      NotificationText.showSnackBar(
                          context: context,
                          text: "${favoriteBeer.nameBeer} dismissed");
                    }
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(transformStringInitials(
                          title: favoriteBeer.nameBeer, maxlength: 2)),
                    ),
                    title: Text(favoriteBeer.nameBeer ?? ''),
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.beer.path,
                          arguments: favoriteBeer.idBeer);
                    },
                  ));
            }));
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text('Favorites beers'),
            ),
            body: Container(
              child: getFav(),
            ),
          );
  }
}
