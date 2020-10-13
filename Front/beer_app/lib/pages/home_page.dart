import 'package:flutter/material.dart';
// import 'package:beer_app/components/beer_component.dart';
import 'package:beer_app/models/beer.dart';
import 'package:beer_app/services/beer_service.dart';

const Color blueColor = const Color(0xCC2372F0);
const Color iconBackgroundColor = const Color(0xFF647082);
final BorderRadius optionBorderRadius = BorderRadius.circular(8);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BeerService beerService = new BeerService();
  List<Beer> listBeer = new List<Beer>();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    this.listBeer = await beerService.getAll();
    var a = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _Background(
            width: width * 0.4,
            height: height * 0.8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              _AppBar(),
              SizedBox(
                height: 30,
              ),
              _Title(
                text: 'Featured Products',
              ),
              SizedBox(
                height: 30,
              ),
              _SettingAndOptions(),
              SizedBox(
                height: 30,
              ),
              BlocBuilder<ItemBloc, ItemSelectedState>(
                builder: (context, state) {
                  return _ItemsWidget(
                    items: state.selectedItem,
                    screenWidth: width,
                    screenHeight: height,
                  );
                },
              ),
              Spacer(),
              _BottomBar(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
