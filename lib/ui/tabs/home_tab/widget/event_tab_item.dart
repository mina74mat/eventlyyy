import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
  bool isSelected;
  String eventName;

  EventTabItem({super.key, required this.isSelected, required this.eventName});

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
        border: Border.all(color: Theme.of(context).focusColor, width: 2),
        color: isSelected ? Theme.of(context).focusColor : Colors.transparent,
      ),
      child: Text(
        eventName,
        style: isSelected
            ? Theme.of(context).textTheme.headlineMedium
            : Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
