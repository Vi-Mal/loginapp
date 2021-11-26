import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'myhomepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  var otpctl = TextEditingController();
  var _otpvisible = true;
  bool _isObscure = true;
  var cmail = "rainavimal454@gmail.com";
  var password = "Test#1234";
  var mailid = TextEditingController();
  var passwrd = TextEditingController();
  var loginmailidCheck = false;

  set otpvisible(value) {
    setState(() {
      _otpvisible = value;
    });
  }

  bool validatePassword(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Welcome,",
                  style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  "to FuturaInstTech,",
                  style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Sign in to continue!",
                  style: TextStyle(
                      fontSize: 20, color: Colors.grey.shade400),
                ),
              ],
            ),
              const SizedBox(height: 180),
              if(_otpvisible == false)
                Container(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: otpctl,
                      decoration: InputDecoration(
                        labelText: "OTP",
                        labelStyle: TextStyle(
                            fontSize: 14, color: Colors.grey.shade400),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            )),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Resend Otp",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          if (otpctl.text == "1234") {
                            setState(() async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool("isLoggedIn", true);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                  (Route<dynamic> route) => false);
                            });
                          } else {
                            Fluttertoast.showToast(
                              msg: "incorrect otp",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                            );
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xffB2FEFA),
                                Color(0xff0ED2F7),
                                Color(0xffB2FEFA),
                              ],
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            constraints: const BoxConstraints(
                                maxWidth: double.infinity, minHeight: 50),
                            child: const Text(
                              "verify",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              if(_otpvisible == true)
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          TextField(
                            textInputAction: TextInputAction.next,
                            controller: mailid,
                            decoration: InputDecoration(
                              labelText: "Email ID",
                              labelStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextField(
                            textInputAction: TextInputAction.done,
                            obscureText: _isObscure,
                            controller: passwrd,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  )),
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                if (EmailValidator.validate(mailid.text) && validatePassword(passwrd.text)) {
                                  setState(() {
                                    _otpvisible = false;
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "incorrect username/password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                  );
                                }
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffB2FEFA),
                                      Color(0xff0ED2F7),
                                      Color(0xffB2FEFA),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  constraints: const BoxConstraints(
                                      maxWidth: double.infinity, minHeight: 50),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              // child: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(6),
                              // ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
