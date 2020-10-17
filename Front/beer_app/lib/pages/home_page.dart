import 'package:beer_app/store/store.dart';
import 'package:beer_app/utils/enums.dart';
import 'package:beer_app/widgets/home_page/home_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:beer_app/widgets/list_beer_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

const Color blueColor = const Color(0xCC2372F0);
const Color iconBackgroundColor = const Color(0xFF647082);
final BorderRadius optionBorderRadius = BorderRadius.circular(8);

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: new Text(
      //     'Punk API',
      //     style: Theme.of(context).textTheme.headline5,
      //     textAlign: TextAlign.center,
      //   ),
      // ),

      body: ListBeerWidget(),
      floatingActionButton: Observer(
        builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: getButton(),
              ),
            ]),
      ),
    );
  }

  List<Widget> getButton() {
    var listButton = [
      FloatingActionButton.extended(
        heroTag: "BtnDisplayPage",
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.background,
        tooltip: 'Page',
        isExtended: true,
        icon: HomeMenuWidget(),
        label: Text(
          StoreApp.beerStore.getCurrentPage.toString(),
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    ];

    if (StoreApp.beerStore.getCurrentPage != 1) {
      listButton = [
        FloatingActionButton(
          heroTag: "BtnDecrement",
          onPressed: () {
            StoreApp.beerStore.decrementCurrentPage();
            StoreApp.beerStore.setIsLoadingPage = true;
          },
          tooltip: 'Decrement',
          child: Icon(Icons.arrow_back),
        ),
        ...listButton,
      ];
    }

    if (StoreApp.beerStore.getActionCurrentPage != ActionCurrentPage.dec) {
      listButton = [
        ...listButton,
        FloatingActionButton(
          heroTag: "BtnIncrement",
          onPressed: () {
            StoreApp.beerStore.incrementCurrentPage();
            StoreApp.beerStore.setIsLoadingPage = true;
          },
          tooltip: 'Increment',
          child: Icon(Icons.arrow_forward),
        ),
      ];
    }

    return listButton;
  }
}
