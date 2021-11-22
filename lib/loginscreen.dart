import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myhomepage.dart';

// void main() {
//   runApp(const MyApp2());
// }
//
// class MyApp2 extends StatelessWidget {
//   const MyApp2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(),
//     );
//   }
// }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("Assets/img.png"),
                    colorFilter: ColorFilter.mode(Colors.grey.withOpacity(.3), BlendMode.dstATop),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 90.0),
                    const Center(
                      child: Text('FuturaInsTech',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,),
                      ),
                    ),
                const SizedBox(height: 200.0),
                Container(
                    padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor:Colors.white,
                            filled: true,
                            focusColor: Colors.red,
                            hintText: "E-mail",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor:Colors.white,
                            filled: true,
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50.0),
                        SizedBox(
                          height: 40.0,
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.alphaBlend(Colors.cyan, Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text("Login"),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => otp()),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        )
    );
  }
}

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  _otpState createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage("Assets/img.png"),
                        colorFilter: ColorFilter.mode(Colors.grey.withOpacity(.3), BlendMode.dstATop),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 90.0),
                    const Center(
                      child: Text('FuturaInsTech',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,),
                      ),
                    ),
                    const SizedBox(height: 200.0),
                    Container(
                        padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                fillColor:Colors.white,
                                filled: true,
                                hintText: "OTP",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 50.0),
                            SizedBox(
                              height: 40.0,
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.alphaBlend(Colors.cyan, Colors.black),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text("verify"),
                                onPressed: (){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (BuildContext context) => MyHomePage()));
                                },
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            )
    );
  }
}
