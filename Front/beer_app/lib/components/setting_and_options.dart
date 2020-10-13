import 'package:beer_app/configuration/colors.dart';
import 'package:flutter/material.dart';

class SettingAndOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.short_text,
            color: ColorsConf.iconBackgroundColor,
            size: 50,
          ),
          SizedBox(
            width: 20,
          ),
          
            OptionsWidget(
                selectedOptionId: 1,
              );
            },
          ),
        ],
      ),
    );
  }
}
