import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../component/CameraComponent.dart';
import 'HomePage.dart';
import '../Component/DropDownButton.dart';

class QuickInputPage extends StatefulWidget {
  const QuickInputPage({Key? key,
    required this.title,
    required this.camera
  }) : super(key: key);

  final String title;
  final CameraDescription camera;

  @override
  State<QuickInputPage> createState() => _QuickInputPageState();
}

const List<String> menHardnessList = <String>[
  'バリカタ',
  'カタ',
  'フツウ',
  'ヤワ',
  'バリヤワ'
];
const List<String> menThicknessList = <String>['細', '中', '太', '極細', '極太'];
const List<String> menTypeList = <String>['縮れ麺', '辛麺麺', '多加水麺', '変わり種'];
const List<String> soupList = <String>[
  '豚骨',
  '醤油',
  '塩',
  '味噌',
  '魚介',
  '鶏ガラ',
  '坦々'
];

class _QuickInputPageState extends State<QuickInputPage> {
  void _movePage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HomePage(title: widget.title, camera: widget.camera);
        },
      ),
    );
  }

  void _takePicture() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return TakePictureScreen(camera: widget.camera);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black54,
                        onPrimary: Colors.white,
                      ),
                      onPressed: _movePage,
                      icon: Icon(Icons.arrow_back_ios),
                      label: Text('Back'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: 100,
                    child: Text(
                      '店名',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        enabled: true,
                        maxLength: 10,
                        obscureText: false,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "最強ラーメン",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ), // 入力フォーム
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: 100,
                    child: Text(
                      'メニュー名',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        enabled: true,
                        maxLength: 10,
                        obscureText: false,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "最強とんこつ",
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ), // 入力フォーム
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: 100,
                    child: Text(
                      '麺',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          child: DropdownButtonMenu(
                            list: menHardnessList,
                          ),
                        ),
                        Container(
                          width: 90,
                          child: DropdownButtonMenu(
                            list: menThicknessList,
                          ),
                        ),
                        Container(
                          width: 100,
                          child: DropdownButtonMenu(
                            list: menTypeList,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ), // 入力フォーム
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: 100,
                    child: Text(
                      'スープ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButtonMenu(
                        list: soupList,
                      ),
                    ),
                  ),
                ],
              ), // 入力フォーム
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 150,
                          height: 150,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white60,
                                onPrimary: Colors.white60,
                                fixedSize: Size.fromWidth(350),
                                side: BorderSide(
                                  color: Colors.white54,
                                ),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                            onPressed: _takePicture,
                            icon: Icon(Icons.add_a_photo),
                            label: const Text('Add Image',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 300,
                          height: 50,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent,
                                onPrimary: Colors.white,
                                fixedSize: Size.fromWidth(350),
                                side: const BorderSide(
                                    // color: Colors.white,
                                    ),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            onPressed: _movePage,
                            icon: Icon(Icons.save_rounded),
                            label: const Text('save Ramen',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
