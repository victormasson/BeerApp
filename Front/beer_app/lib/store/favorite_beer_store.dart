import 'package:beer_app/database/favorite_beer_dal.dart';
import 'package:beer_app/models/favorite_beer.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'favorite_beer_store.g.dart';

// This is the class used by rest of your codebase
class FavoriteBeerStore = _FavoriteBeerStore with _$FavoriteBeerStore;

// The store-class
abstract class _FavoriteBeerStore with Store {
  @observable
  List<FavoriteBeer> listFavoriteBeer;

  bool isFavoriteBeer(int idBeer) =>
      listFavoriteBeer.any((element) => element.idBeer == idBeer);

  @action
  Future<void> addFavoriteBeer({int idBeer, String name}) async {
    var favoriteBeer = FavoriteBeer(idBeer: idBeer, nameBeer: name);
    await FavoriteBeerDal.insert(favoriteBeer);
    await getAllFavoriteBeer();
  }

  @action
  Future<void> removeFavoriteBeer({int idBeer}) async {
    final favoriteBeer = await FavoriteBeerDal.getByIdBeer(idBeer);
    await FavoriteBeerDal.delete(favoriteBeer.id);
    await getAllFavoriteBeer();
  }

  @action
  Future<void> getAllFavoriteBeer() async {
    var listFavoriteBeerValue = await FavoriteBeerDal.all();
    this.listFavoriteBeer = listFavoriteBeerValue;
  }
}
