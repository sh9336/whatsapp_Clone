import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kevlar/Screens/CameraScreen.dart';
import 'package:kevlar/Screens/Home.dart';
import 'package:kevlar/Screens/LoginScreen.dart';
Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  //cameras = await availableCameras();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Color(0xFF075E54),
        colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF128C7E)),
      ),
      home: LoginScreen(),
    );
  }
}

