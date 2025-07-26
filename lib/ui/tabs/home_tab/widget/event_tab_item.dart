import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
  bool isSelected;
  String eventName;
  Color? borderColor;
  Color selectedBgColor;
  TextStyle selectedTextStyle;
  TextStyle unSelectedTextStyle;


  EventTabItem({super.key, required this.isSelected,
    required this.eventName,
    this.borderColor,
    required this.selectedBgColor,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: borderColor ?? Theme
            .of(context)
            .focusColor, width: 2),
        color: isSelected
            ? selectedBgColor
            : Colors.transparent,
      ),
      child: Text(
        eventName,
        style: isSelected
            ? selectedTextStyle
            : unSelectedTextStyle
      ),
    );
  }
}
