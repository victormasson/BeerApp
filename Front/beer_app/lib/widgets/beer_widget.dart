import 'dart:ui';

import 'package:beer_app/models/beer.dart';
import 'package:beer_app/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BeerWidget extends StatefulWidget {
  BeerWidget({Key key, @required this.beer}) : super(key: key);
  final Beer beer;

  @override
  _BeerWidgetState createState() => _BeerWidgetState();
}

class _BeerWidgetState extends State<BeerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 16, 5, 5),
      color: Theme.of(context).backgroundColor,
      child: this.widget.beer == null
          ? Center(child: CircularProgressIndicator())
          : new ListView(
              // shrinkWrap: true,
              children: _listWidget(),
            ),
    );
  }

  Future<void> openInBrowser(String str) async {
    final url =
        'https://brewdogrecipes.com/?q=${transformStringToUrl(text: str)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _nameField(double top) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
      child: SelectableText(
        this.widget.beer.name,
        minLines: 1,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Widget _abvField(double top) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SelectableText(
            '#${this.widget.beer.id.toString()}',
            style: Theme.of(context).textTheme.headline5,
          ),
          Container(
            child: new SelectableText(
              '${this.widget.beer.abv.toString()} %',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
              border: Border.all(
                color: Theme.of(context).highlightColor,
                width: 2,
              ),
            ),
            alignment: AlignmentDirectional.center,
            width: 170,
            height: 170,
          ),
          // outline
          IconButton(
              tooltip: 'Open in browser',
              onPressed: () async => openInBrowser(this.widget.beer.name),
              icon: Icon(
                Icons.open_in_browser,
              )),
        ],
      ),
    );
  }

  Widget _taglineField(double top) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
      child: SelectableText(this.widget.beer.tagline ?? "",
          style: Theme.of(context).textTheme.headline5),
    );
  }

  Widget _brewersTipsField(double top) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Brewers Tips :',
            style: Theme.of(context).textTheme.headline6,
          ),
          SelectableText(
            this.widget.beer.brewersTips ?? "",
            minLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _foodPairingField(double top, double bottom) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, top, 0.0, bottom),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ideas of food pairing :',
              style: Theme.of(context).textTheme.headline6,
            ),
            ...getFoodPairing(this.widget.beer.foodPairing)
          ],
        ));
  }

  List<Widget> getFoodPairing(List<String> listFoodPairing) {
    return List.generate(
        listFoodPairing.length,
        (int index) => ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.label,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              title: SelectableText(listFoodPairing[index],
                  style: Theme.of(context).textTheme.bodyText2),
            ));
  }

  Widget _descriptionField(double top) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
      child: SelectableText(this.widget.beer.description ?? "",
          style: Theme.of(context).textTheme.bodyText2),
    );
  }

  Widget _photoField(double top) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: RadialGradient(
            focalRadius: 10,
            radius: 0.9,
            tileMode: TileMode.clamp,
            colors: [
              Theme.of(context).indicatorColor,
              Theme.of(context).primaryColor
            ]),
      ),
      padding: EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
      child: this.widget.beer.imageUrl != null
          ? Image(
              image: NetworkImage(this.widget.beer.imageUrl),
              alignment: Alignment.center,
              height: 500.0,
            )
          : Icon(
              Icons.photo_rounded,
              color: Theme.of(context).buttonColor,
              size: 300.0,
            ),
    );
  }

  List<Widget> _listWidget() {
    List<Widget> listWidget = [
      _photoField(10.0),
      _abvField(10.0),
      _nameField(10.0),
      _taglineField(5.0),
      _descriptionField(10.0),
      _brewersTipsField(10.0),
    ];
    if (this.widget.beer.foodPairing != null) {
      listWidget = [
        ...listWidget,
        _foodPairingField(20.0, 80.0),
      ];
    }

    return listWidget;
  }
}
