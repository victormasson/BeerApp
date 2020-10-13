import 'package:beer_app/configuration/colors.dart';
import 'package:flutter/material.dart';

class BarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final Function onTap;

  const BarItem({Key key, this.icon, this.title, this.isSelected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected ? ColorsConf.blueColor : Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? Colors.white : ColorsConf.iconBackgroundColor,
            ),
            if (isSelected)
              VerticalDivider(
                color: : ColorsConf.iconBackgroundColor,
              ),
            if (isSelected)
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
