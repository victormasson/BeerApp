import 'package:beer_app/configuration/settings.dart';
import 'package:flutter/material.dart';

class BeerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = Settings.getHeight(context);
    var width = Settings.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }

    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 20),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                alignment: Alignment.topLeft,
                width: width / 1.8,
                child: Image.asset(
                  "assets/mastercardlogo.png",
                  fit: BoxFit.fill,
                )),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: height / 10,
                width: width / 1.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "**** **** **** ",
                          style: TextStyle(
                              fontSize: fontSize(20),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "1930",
                          style: TextStyle(
                              fontSize: fontSize(30),
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Text(
                      "Platinum Card".toUpperCase(),
                      style: TextStyle(
                          fontSize: fontSize(15), fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              alignment: Alignment.bottomRight,
              width: width / 6,
              height: height / 16,
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1.0,
                        color: Colors.lightBlue,
                        spreadRadius: 20.0,
                        offset: Offset.infinite)
                  ],
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
