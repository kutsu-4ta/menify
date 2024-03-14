import 'dart:math';

import 'package:flutter/material.dart';
import 'BarChart.dart';

class HomeMiddleArea extends StatelessWidget {
  final GestureTapCallback onPressed;

  const HomeMiddleArea({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: Colors.white10,
            onPrimary: Colors.white,
            fixedSize: Size.fromWidth(350),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage('Images/HomeMyRamenDataBackground.png'),
                  fit: BoxFit.cover,
                )),
            child: Row(
              children: <Widget>[
                Container(
                  width: 350,
                  alignment: Alignment.center,
                  child: PieChartSample2(),
                ),
              ],
            ),
          ),
        ));
  }
}
