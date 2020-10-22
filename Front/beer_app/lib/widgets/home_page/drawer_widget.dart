import 'package:beer_app/configuration/routes.dart';
import 'package:beer_app/pages/favorite_beer_page.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
          ListView(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topRight: Radius.zero,
                topLeft: Radius.zero),
            gradient: RadialGradient(
                focalRadius: 10,
                radius: 0.9,
                tileMode: TileMode.clamp,
                colors: [
                  Theme.of(context).indicatorColor,
                  Theme.of(context).primaryColor
                ]),
          ),
          currentAccountPicture: Icon(
            Icons.sports_bar_rounded,
            size: 40,
            color: Theme.of(context).colorScheme.secondary,
          ),
          accountEmail: Text('A Flutter project with Punk API Beer.',
              style: Theme.of(context).textTheme.subtitle2),
          accountName: Text('Punk API Beer',
              style: Theme.of(context).textTheme.headline4),
        ),
        ListTile(
          title: Text('Favorites beers'),
          leading: CircleAvatar(
            child: Icon(RoutesName.beer.icon,
                color: Theme.of(context).primaryColorLight),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FavoriteBeerPage();
            }));
          },
        ),
        ListTile(
          title: Text('Radom beer'),
          leading: CircleAvatar(
            child: Icon(RoutesName.beer.icon,
                color: Theme.of(context).primaryColorLight),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          onTap: () {
            Navigator.pushNamed(context, RoutesName.beer.path,
                arguments: 'random');
          },
        ),
        ListTile(
          title: Text(RoutesName.settings.title),
          leading: CircleAvatar(
            child: Icon(RoutesName.settings.icon,
                color: Theme.of(context).primaryColorLight),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          onTap: () {
            Navigator.pushNamed(context, RoutesName.settings.path);
          },
        ),
      ]),
    );
  }
}
