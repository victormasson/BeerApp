import 'package:beer_app/widgets/home_page/drawer_widget.dart';
import 'package:beer_app/widgets/home_page/navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:beer_app/widgets/list_beer_widget.dart';

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
      drawer: DrawerWidget(),
      body: ListBeerWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NavigationWidget(),
    );
  }
}
