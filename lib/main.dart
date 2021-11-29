import 'package:flutter/material.dart';
import 'package:loginapp/empinfo.dart';
import 'package:loginapp/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashHome(),
      routes: {
        EmpInfo.routeName: (ctx) => EmpInfo(),
      },
    );
  }
}
