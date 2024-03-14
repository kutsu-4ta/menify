import 'package:camera/camera.dart';
import '../Component/HomeTopArea.dart';
import '../Component/HomeMiddleArea.dart';
import 'package:flutter/material.dart';
import 'package:menify/View/QuickInputPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.title,
    required this.camera,
  }) : super(key: key);

  final String title;
  final CameraDescription camera;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _movePage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return QuickInputPage(
            title: widget.title,
            camera: widget.camera,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title, style: TextStyle(color: Colors.white),),
      //   backgroundColor: Colors.black,
      //   elevation: 0,
      //   shape: Border(
      //     bottom: BorderSide(color: Colors.white, width: 2)
      //   ),
      // ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 100, left: 15, right: 15),
          // padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(
                  'Recomend',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              HomeTopArea(
                onPressed: _movePage,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                child: Text(
                    'Ramen Data',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: HomeMiddleArea(
                        onPressed: _movePage
                    ),
                  ),
                ],
              ), // マイラーメンデータ
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Expanded(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 300,
                            height: 60,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent,
                                  onPrimary: Colors.white,
                                  fixedSize: Size.fromWidth(350),
                                  side: BorderSide(
                                    // color: Colors.white,
                                  ),
                              ),
                              onPressed: _movePage,
                              icon: Icon(Icons.edit),
                              label: Text('add Ramen Log',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ), // ボトムボタン
            ],
          ),
        ),
      ),
    );
  }
}
