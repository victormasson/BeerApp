import 'package:flutter/material.dart';
import 'package:beer_app/store/store.dart';
import 'package:beer_app/utils/enums.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeMenuDataWidget extends StatefulWidget {
  @override
  _HomeMenuDataWidgetState createState() => _HomeMenuDataWidgetState();
}

class _HomeMenuDataWidgetState extends State<HomeMenuDataWidget> {
  Widget getMenuNumberBeer() {
    return Observer(
      builder: (_) => DropdownButton<int>(
        value: StoreApp.beerStore.getRowsPerPage,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: Theme.of(context).textTheme.bodyText1,
        underline: Container(
          height: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
        onChanged: (int newValue) {
          StoreApp.beerStore.setRowsPerPage = newValue;
          StoreApp.beerStore.setCurrentPage = 1;
          StoreApp.beerStore.setIsLoadingPage = true;
        },
        items: <int>[10, 25, 50, 80].map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(
              '${value.toString()}',
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget getMenuSortBeer() {
    return Observer(
      builder: (_) => DropdownButton<ActionSortList>(
        value: StoreApp.beerStore.getActionSortList,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: Theme.of(context).textTheme.bodyText1,
        underline: Container(
          height: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
        onChanged: (ActionSortList newValue) {
          StoreApp.beerStore.setActionSortList = newValue;
          StoreApp.beerStore.setIsLoadingPage = true;
        },
        items: <ActionSortList>[
          ActionSortList.none,
          ActionSortList.asc,
          ActionSortList.desc,
        ].map<DropdownMenuItem<ActionSortList>>((ActionSortList value) {
          return DropdownMenuItem<ActionSortList>(
            value: value,
            child: Text(
              '${actionSortListString[value]}',
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Change number beer per page',
          child: getMenuNumberBeer(),
        ),
        PopupMenuItem<String>(
          value: 'Change sort of the list beer',
          child: getMenuSortBeer(),
        ),
      ],
    );
  }
}
