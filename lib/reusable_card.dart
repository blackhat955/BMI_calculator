import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({@required this.colour, this.cardData, this.onPress});
  final Color colour;
  final Widget cardData;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardData,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
