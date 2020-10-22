import 'package:beer_app/models/beer.dart';
import 'package:beer_app/utils/string_utils.dart';
import 'package:flutter/material.dart';

class MethodWidget extends StatefulWidget {
  MethodWidget({Key key, this.beer});
  final Beer beer;

  @override
  _MethodWidgetState createState() => _MethodWidgetState();
}

class _MethodWidgetState extends State<MethodWidget> {
  Method method;

  @override
  void initState() {
    super.initState();
    method = this.widget.beer.method;
  }

  List<Widget> getMashTemp() {
    return method.mashTemp
        .map((mashTemp) => ListTile(
              leading: CircleAvatar(
                child: Text(
                    transformStringInitials(title: 'Temperature', maxlength: 2),
                    style: Theme.of(context).textTheme.headline6),
              ),
              title: Text(
                'Temperature',
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Temp'),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      ),
                      Text(
                        '${mashTemp.temp.value.toString()} ${mashTemp.temp.unit}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  mashTemp.duration == null
                      ? Row()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('duration'),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                            ),
                            Text(
                              '${mashTemp.duration}',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        )
                ],
              ),
            ))
        .toList();
  }

  Widget getFermentation() {
    return ListTile(
      leading: CircleAvatar(
        child: Text(transformStringInitials(title: 'Temperature', maxlength: 2),
            style: Theme.of(context).textTheme.headline6),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Temp'),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
          ),
          Text(
            '${method.fermentation.temp.value.toString()}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
          ),
          Text(
            '${method.fermentation.temp.unit}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }

  Widget getTwist() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              '${method.twist}',
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getListItem() {
    var listItem = [
      ExpansionTile(
        title: Text(
          "Mash Temperature",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        initiallyExpanded: true,
        children: getMashTemp(),
      ),
      ExpansionTile(
        title: Text(
          "Fermentation",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        initiallyExpanded: true,
        children: [getFermentation()],
      ),
    ];

    if (method.twist != null) {
      listItem = [
        ...listItem,
        ExpansionTile(
          title: Text(
            "Twist",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          initiallyExpanded: true,
          children: [getTwist()],
        ),
      ];
    }

    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.fromLTRB(0, 45, 0, 80.0),
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
