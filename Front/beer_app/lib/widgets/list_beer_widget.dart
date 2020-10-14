import 'package:beer_app/configuration/themev2.dart';
import 'package:beer_app/models/beer.dart';
import 'package:beer_app/widgets/beer_widget.dart';
import 'package:flutter/material.dart';

class ListBeerWidget extends StatefulWidget {
  ListBeerWidget({Key key, @required this.listBeer});
  final List<Beer> listBeer;

  @override
  _ListBeerWidgetState createState() => _ListBeerWidgetState();
}

class _ListBeerWidgetState extends State<ListBeerWidget> {
  @override
  Widget build(BuildContext context) {
    print("build listview");

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: this.widget.listBeer.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Beer beer = this.widget.listBeer[index];

              return new ListTile(
                leading: CircleAvatar(
                  child: new Image(
                    image: new NetworkImage(beer.imageUrl),
                  ),
                ),
                title: Text(beer.name),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(beer.tagline)),
                    Text(
                      beer.abv.toString(),
                      style: new TextStyle(
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
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext ctx) => MaterialApp(
                            title: 'Flutter Demo',
                            theme: ThemeV2.light, //ThemeConf.light,
                            darkTheme: ThemeV2.dark,
                            themeMode: ThemeMode.light,
                            home: new BeerWidget(beer: beer),
                          )));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
