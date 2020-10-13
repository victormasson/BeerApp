import 'package:beer_app/components/bar_item.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  void onItemTapped(int tappedItemIndex) {
    setState(() {
      selectedIndex = tappedItemIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClayContainer(
        height: 60,
        borderRadius: 10,
        color: Colors.white,
        spread: 10,
        depth: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BarItem(
                icon: Icons.home,
                title: 'Home',
                isSelected: selectedIndex == 0,
                onTap: () {
                  onItemTapped(0);
                },
              ),
              BarItem(
                icon: Icons.person,
                title: 'Profile',
                isSelected: selectedIndex == 1,
                onTap: () {
                  onItemTapped(1);
                },
              ),
              BarItem(
                icon: Icons.settings,
                title: 'Settings',
                isSelected: selectedIndex == 2,
                onTap: () {
                  onItemTapped(2);
                },
              ),
              BarItem(
                icon: Icons.bookmark,
                title: 'Wishlist',
                isSelected: selectedIndex == 3,
                onTap: () {
                  onItemTapped(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
