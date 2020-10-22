import 'package:beer_app/store/store.dart';
import 'package:beer_app/utils/enums.dart';
import 'package:beer_app/widgets/home_page/home_menu_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NavigationWidget extends StatelessWidget {
  List<Widget> getButton(BuildContext context) {
    var listButton = [
      Container(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
          child: Row(
            children: [
              HomeMenuDataWidget(),
              Text(
                StoreApp.beerStore.getCurrentPage.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          )),
    ];

    if (StoreApp.beerStore.getCurrentPage != 1) {
      listButton = [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            color: Theme.of(context).colorScheme.background,
          ),
          child: IconButton(
            tooltip: 'Previous page',
            onPressed: () {
              StoreApp.beerStore.decrementCurrentPage();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        ...listButton,
      ];
    } else {
      listButton = [
        Container(
          padding: EdgeInsets.fromLTRB(24, 0.0, 24, 0.0),
        ),
        ...listButton,
      ];
    }

    if (StoreApp.beerStore.getActionCurrentPage != ActionCurrentPage.dec) {
      listButton = [
        ...listButton,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            color: Theme.of(context).colorScheme.background,
          ),
          child: IconButton(
            tooltip: 'Next page',
            onPressed: () {
              StoreApp.beerStore.incrementCurrentPage();
            },
            icon: Icon(Icons.arrow_forward),
          ),
        )
      ];
    } else {
      listButton = [
        ...listButton,
        Container(
          padding: EdgeInsets.fromLTRB(24, 0.0, 24, 0.0),
        ),
      ];
    }

    return listButton;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Container(
              width: 176,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  // gradient: RadialGradient(
                  //     focalRadius: 30,
                  //     radius: 1.1,
                  //     tileMode: TileMode.clamp,
                  //     colors: [
                  //       Theme.of(context).indicatorColor,
                  //       Theme.of(context).primaryColor
                  //     ]),
                  color: Theme.of(context).primaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getButton(context),
              ),
            ));
  }
}
