import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'customcardlist.dart';

class empApiData extends StatefulWidget {
  const empApiData({Key? key}) : super(key: key);

  @override
  _empApiDataState createState() => _empApiDataState();
}

class _empApiDataState extends State<empApiData> {

  Future getApiData() async {
    var response = await http.get(Uri.https('simplifiedcoding.net', 'demos/marvel'));
    var jsonData = jsonDecode(response.body);

    for (var u in jsonData){
      // users.add(CustomCard(name:u["name"],realname:u["id"]));
      var user = CustomCard(name:u["name"],realname:u["realname"]);
      ApiData.list.add(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('employee'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body:FutureBuilder(
                future: _empApiDataState().getApiData(),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: ApiData.list,
                        ),
                    );
                  }
                    else {
                      return Center(child: CircularProgressIndicator());
                  }
                },
              )
    );
  }
}

class ApiData{
  static final List<Widget> list = [];
}

