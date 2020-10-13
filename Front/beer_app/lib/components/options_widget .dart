import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  final int selectedOptionId;

  const OptionsWidget({Key key, this.selectedOptionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          for (int index = 0; index < options.length; index++)
            OptionWidget(
                option: options[index],
                index: index,
                isSelected: options[index].id == selectedOptionId),
        ],
      ),
    );
  }
}
