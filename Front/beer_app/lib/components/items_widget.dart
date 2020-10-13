import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  final List<Item> items;
  final double screenWidth, screenHeight;

  const ItemsWidget({Key key, this.items, this.screenWidth, this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailScreen()));
      },
      child: SizedBox(
        height: screenHeight * 0.42,
        child: PageView.builder(
            itemCount: items.length,
            controller: PageController(viewportFraction: 0.7),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: <Widget>[
                    Material(
                      elevation: 10,
                      shape: ItemCardShape(
                        screenWidth * 0.64,
                        screenHeight * 0.38,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Align(
                        alignment: Alignment(0, -0.1),
                        child: Image.asset(items[index].imagePath),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 32,
                      right: 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            items[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            items[index].description,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 40,
                      child: Image.asset(
                        'assets/icons/ps_logo.png',
                        width: 50,
                        height: 50,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
