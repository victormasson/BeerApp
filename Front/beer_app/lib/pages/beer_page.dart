import 'package:beer_app/models/beer.dart';
import 'package:beer_app/store/store.dart';
import 'package:beer_app/widgets/beer_widget.dart';
import 'package:beer_app/widgets/ingredients_widget.dart';
import 'package:beer_app/widgets/method_widget.dart';

import 'package:flutter/material.dart';

class BeerPage extends StatefulWidget {
  BeerPage({Key key, this.id});
  final int id;

  @override
  _BeerPageState createState() => _BeerPageState();
}

class _BeerPageState extends State<BeerPage>
    with SingleTickerProviderStateMixin {
  _BeerPageState();
  TabController _tabController;
  final Beer beer = StoreApp.beerStore.getBeer;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
        vsync: this, initialIndex: _selectedIndex, length: getWidget().length);

    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  List<Widget> getWidget() {
    return [
      BeerWidget(beer: beer),
      IngredientsWidget(beer: beer),
      MethodWidget(beer: beer),
    ];
  }

  List<Widget> getTabs() {
    return [
      Tab(
        icon: _selectedIndex == 0
            ? Icon(Icons.sports_bar)
            : Icon(Icons.sports_bar_outlined),
        text: 'Beer',
      ),
      Tab(
        icon: _selectedIndex == 1
            ? Icon(Icons.view_comfy)
            : Icon(Icons.view_comfy_outlined),
        text: 'Ingredients',
      ),
      Tab(
        icon: _selectedIndex == 2
            ? Icon(Icons.science)
            : Icon(Icons.science_outlined),
        text: 'Method',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomSheet: TabBar(
        controller: _tabController,
        indicatorColor: Theme.of(context).indicatorColor,
        unselectedLabelColor: Theme.of(context).colorScheme.primary,
        labelColor: Theme.of(context).indicatorColor,
        tabs: getTabs(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: getWidget(),
      ),
    );
  }
}
