import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/loginscreen.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({Key? key}) : super(key: key);

  @override
  State<SplashHome> createState() => _SplashHome();
}

class _SplashHome extends State<SplashHome> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('Assets/img.png'),
      ),
    );
  }
}
