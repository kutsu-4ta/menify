import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../Consts/app.dart';
import '../View/QuickInputPage.dart';

/// 写真撮影画面
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      // カメラを指定
      widget.camera,
      // 解像度を定義
      ResolutionPreset.medium,
    );

    // コントローラーを初期化
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // ウィジェットが破棄されたら、コントローラーを破棄
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 写真を撮る
          final image = await _controller.takePicture();
          // 表示用の画面に遷移
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DisplayPictureScreen(imagePath: image.path, camera: widget.camera),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// 撮影した写真を表示する画面
class DisplayPictureScreen extends StatefulWidget {
  const DisplayPictureScreen({
    Key? key,
    required this.imagePath,
    required this.camera,
  }) : super(key: key);

  final String imagePath;
  final CameraDescription camera;

  @override
  DisplayPictureScreenState createState() => DisplayPictureScreenState();
}

class DisplayPictureScreenState extends State<DisplayPictureScreen> {


  void _movePage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return QuickInputPage(title: AppConst.APP_NAME, camera: widget.camera);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('撮れた写真')),
      // body: Center(child: Image.file(File(imagePath))),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Text('撮れた写真'),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(
                        top: 20,
                        bottom: 10
                    ),
                    child: Image.file(File(widget.imagePath)),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 150,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white24,
                          onPrimary: Colors.white,
                          fixedSize: Size.fromWidth(350),
                          side: BorderSide(
                            // color: Colors.white,
                          ),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                      onPressed: _movePage,
                      icon: Icon(Icons.back_hand),
                      label: const Text('戻る',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )
                      ),
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