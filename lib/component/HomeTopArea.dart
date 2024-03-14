import 'package:flutter/material.dart';

class HomeTopArea extends StatelessWidget {
  final GestureTapCallback onPressed;

  const HomeTopArea({Key? key, required this.onPressed}) : super(key: key);

  // ラーメンタイル
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < 10; i++)
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.black,
              ),
              child: Container(
                color: i.isEven ? Colors.blue : Colors.pink,
                width: 150,
                height: 140,
                child: Container(
                    width: 150,
                    height: 50,
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(top: 90),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Column(
                      children: [
                        Text(
                          "★★★☆☆",
                          style: TextStyle(color: Colors.yellow, fontSize: 15),
                        ),
                        Text(
                          'ラーメン',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    )),
              ),
            )
        ],
      ),
    );
  }
}
