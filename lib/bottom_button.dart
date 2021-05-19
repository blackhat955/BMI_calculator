import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class BottumButton extends StatelessWidget {
  BottumButton({@required this.onTap, @required this.buttonTittle});
  final Function onTap;
  final String buttonTittle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ResultPage(),
      //     ),
      //   );
      // },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              buttonTittle,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        // child:
        color: bottonContainerColor,
        margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
