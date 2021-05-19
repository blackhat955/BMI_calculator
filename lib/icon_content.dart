import 'package:flutter/material.dart';

const cardText = Color(0xFF8D8E98);

class IconContant extends StatelessWidget {
  IconContant({@required this.icon, this.lable});
  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: cardText,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          lable,
          style: TextStyle(fontSize: 20.0, color: cardText),
        )
      ],
    );
  }
}
