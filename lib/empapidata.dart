import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;import 'package:flutter/material.dart';

import 'empinfo.dart';

class avengersApi extends StatefulWidget {
  @override
  _avengersApiState createState() => _avengersApiState();
}

class _avengersApiState extends State<avengersApi> {
  List avengerapidata = [];
  List name_avenger = [];
  bool isSearching = false;

  getAvengers() async {
    var response = await http.get(Uri.https('simplifiedcoding.net', 'demos/marvel'));
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    getAvengers().then((data) {
      setState(() {
        avengerapidata = name_avenger = data;
      });
    });
    super.initState();
  }

  void _filterAvengername(value) {
    setState(() {
      name_avenger = avengerapidata
          .where((country) =>
          country['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
  
  Widget buildDivider() {
    return Divider(
      height: 0.0,
      color: Colors.black38,
      indent: 95.0,
      endIndent: 10.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0ED2F7),
        title: !isSearching
            ? Text('avengers')
            : TextField(
          onChanged: (value) {
            _filterAvengername(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search hero here",
              hintStyle: TextStyle(color: Colors.white)),
        ),
        actions: <Widget>[
          isSearching
              ? IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                this.isSearching = false;
                name_avenger = avengerapidata;
              });
            },
          )
              : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                this.isSearching = true;
              });
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: name_avenger.length > 0
            ? ListView.builder(
            itemCount: name_avenger.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(EmpInfo.routeName,
                      arguments: name_avenger[index]);
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child:ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(name_avenger[index]['imageurl']),
                              ),
                              title: Text(
                              name_avenger[index]['name'],
                              style: TextStyle(fontSize: 18),
                            ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                ),
              );
            })
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
