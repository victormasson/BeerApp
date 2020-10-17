import 'package:beer_app/models/beer.dart';
import 'package:beer_app/utils/string_utils.dart';
import 'package:flutter/material.dart';

class IngredientsWidget extends StatefulWidget {
  IngredientsWidget({Key key, this.beer});
  final Beer beer;

  @override
  _IngredientsWidgetState createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  Ingredients ingredients;

  @override
  void initState() {
    super.initState();
    ingredients = this.widget.beer.ingredients;
  }

  List<Widget> getHops() {
    return ingredients.hops
        .map((hop) => ListTile(
              leading: CircleAvatar(
                child: Text(
                    transformStringInitials(title: hop.name, maxlength: 2),
                    style: Theme.of(context).textTheme.headline6),
              ),
              title: Text(
                hop.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Add'),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      ),
                      Text(
                        '${hop.add}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Attribute'),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      ),
                      Text(
                        '${hop.attribute}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${hop.amount.unit}'),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      ),
                      Text(
                        '${hop.amount.value.toString()}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ],
              ),
            ))
        .toList();
  }

  List<Widget> getMalt() {
    return ingredients.malt
        .map((malt) => ListTile(
              leading: CircleAvatar(
                child: Text(
                    transformStringInitials(title: malt.name, maxlength: 2),
                    style: Theme.of(context).textTheme.headline6),
              ),
              title: Text(
                malt.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${malt.amount.unit}'),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      ),
                      Text(
                        '${malt.amount.value.toString()}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ],
              ),
            ))
        .toList();
  }

  List<Widget> getListItem() {
    return [
      ExpansionTile(
        title: Text(
          "Hops",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        initiallyExpanded: true,
        children: getHops(),
      ),
      ExpansionTile(
        title: Text(
          "Malt",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        initiallyExpanded: true,
        children: getMalt(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ListView.builder(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 80.0),
          itemCount: getListItem().length,
          itemBuilder: (context, index) {
            var item = getListItem()[index];
            return Container(
              child: item,
            );
          }),
    );
  }
}
