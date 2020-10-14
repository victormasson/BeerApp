import 'package:flutter/material.dart';
import 'package:beer_app/widgets/list_beer_widget.dart';
import 'package:beer_app/models/beer.dart';
import 'package:beer_app/services/beer_service.dart';

const Color blueColor = const Color(0xCC2372F0);
const Color iconBackgroundColor = const Color(0xFF647082);
final BorderRadius optionBorderRadius = BorderRadius.circular(8);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BeerService beerService = new BeerService();
  List<Beer> listBeer = new List<Beer>();

  @override
  void initState() {
    super.initState();
    getFetchBeer();
  }

  Future<void> getFetchBeer() async {
    var lstBeer = await beerService.getAll(page: 1, perPage: 80);
    setState(() {
      this.listBeer = lstBeer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Relish Eat'),
      ),
      body: this.listBeer != null && this.listBeer.length == 0
          ? Column(
              children: [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
            )
          : RefreshIndicator(
              child: ListBeerWidget(listBeer: this.listBeer),
              onRefresh: () async {
                getFetchBeer();
              },
            ),
    );
  }
}
