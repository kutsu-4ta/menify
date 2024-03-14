import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'View/HomePage.dart';
import 'Consts/app.dart';
import 'package:camera/camera.dart';
import 'provider/providers.dart';

void main() async {
  // main 関数内で非同期処理を呼び出すための設定
  WidgetsFlutterBinding.ensureInitialized();
  // デバイスで使用可能なカメラのリストを取得
  final cameras = await availableCameras();
  // 利用可能なカメラのリストから特定のカメラを取得
  final firstCamera = cameras.first;
  runApp(ProviderScope(child: MyApp(
      camera: firstCamera
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key, required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
          title: AppConst.APP_NAME,
          camera: camera
      ),
    );
  }
}
