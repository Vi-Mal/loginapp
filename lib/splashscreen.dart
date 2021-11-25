import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'myhomepage.dart';

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
        navigateUser,
    );
  }

  void navigateUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    if (status) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => LoginPage()));    }
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

