import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:loginapp/namelist.dart';
import 'customappbar.dart';
import 'customdrawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomBarWidget(),
        drawer: CustomDrawer(),
        body: FooterView(
          children: [],
          footer: Footer(
            backgroundColor: const Color(0xff5bacecff),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Column(
                  children: const [
                    Text("© Sujarajan Consultancy Private Limited ",style: TextStyle(
                      fontSize: 10,
                    ),),
                    Text("CIN-U72900TN2019PTC130512",style: TextStyle(
                      fontSize: 9,
                    ),),
                  ],
                ),
              ),
            ),
          ),
          flex: 1,
        ),
        floatingActionButton: const Align(
            child: FloatingActionButton(
              backgroundColor: Color(0xff403B4A),
              child: Icon(
                Icons.add,
              ),
              elevation: 10,
              onPressed: null,
            ),
            alignment: Alignment(1, .9)),

      )
    );
  }
}
