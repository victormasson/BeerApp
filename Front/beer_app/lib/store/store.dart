import 'package:beer_app/store/beer_store.dart';
import 'package:beer_app/store/favorite_beer_store.dart';
import 'package:beer_app/store/global_store.dart';

class StoreApp {
  static BeerStore beerStore;
  static FavoriteBeerStore favoriteBeerStore;
  static GlobalStore globalStore;
}

initStore() {
  StoreApp.beerStore = BeerStore();
  StoreApp.globalStore = GlobalStore();
  StoreApp.favoriteBeerStore = FavoriteBeerStore();
}
