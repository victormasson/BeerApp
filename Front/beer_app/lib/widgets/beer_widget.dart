import 'package:beer_app/models/beer.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: new Container(
        padding: EdgeInsets.all(16.0),
        color: Theme.of(context).backgroundColor,
        child: this.widget.beer == null
            ? Center(child: CircularProgressIndicator())
            : new ListView(
                shrinkWrap: true,
                children: _listWidget(),
              ),
      ),
    );
  }

  Widget _nameField(double top) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
      child: SelectableText(
        this.widget.beer.name ?? "",
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget _abvField(double top) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
      child: Center(
        child: new Container(
          child: new SelectableText(this.widget.beer.abv.toString() ?? "",
              style: Theme.of(context).textTheme.headline2),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.lightBlue[900],
            border: Border.all(
              color: Theme.of(context).highlightColor,
              width: 2,
            ),
          ),
          alignment: AlignmentDirectional.center,
          // padding: new EdgeInsets.fromLTRB(26.0, 26.0, 26.0, 26.0),
          width: 170,
          height: 170,
        ),
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

  Widget _foodPairingField(double top) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ideas of food pairing :",
                style: Theme.of(context).textTheme.headline4),
            ...getFoodPairing(this.widget.beer.foodPairing)
          ],
        ));
  }

  List<Widget> getFoodPairing(List<String> listFoodPairing) {
    return List.generate(
      listFoodPairing.length,
      (int index) => Row(children: [
        Icon(Icons.label),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        Flexible(
          child: Text(listFoodPairing[index],
              style: Theme.of(context).textTheme.bodyText1),
        ),
      ]),
    );
  }

  Widget _descriptionField(double top) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
      child: SelectableText(this.widget.beer.description ?? "",
          style: Theme.of(context).textTheme.bodyText1),
    );
  }

  Widget _photoField(double top) {
    return Container(
      color: Colors.blue,
      child: Container(
        padding: EdgeInsets.fromLTRB(0.0, top, 0.0, 0.0),
        child: this.widget.beer.imageUrl != null
            ? Image(
                image: NetworkImage(this.widget.beer.imageUrl),
                alignment: Alignment.center,
                height: 500.0,
              )
            : Icon(
                Icons.photo,
                color: Theme.of(context).buttonColor,
              ),
      ),
    );
  }

  List<Widget> _listWidget() {
    List<Widget> listWidget = [
      _photoField(10.0),
      _taglineField(5.0),
      _abvField(10.0),
      _nameField(10.0),
      _descriptionField(10.0),
    ];

    if (this.widget.beer.foodPairing != null) {
      listWidget = [
        ...listWidget,
        _foodPairingField(20.0),
      ];
    }

    return listWidget;
  }
}
