import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmpInfo extends StatelessWidget {
  static const routeName = '/empinfo';

  @override
  Widget build(BuildContext context) {
    final Map heroinfo = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title:  Text(heroinfo['name']),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Image.network(heroinfo['imageurl']),
                SizedBox(height: 20),
                Text("Real Name: " +heroinfo['realname']),
                SizedBox(height: 20),
                Text("Team: " +heroinfo['team']),
                SizedBox(height: 20),
                Text("First Appearance: "+heroinfo['firstappearance']),
                SizedBox(height: 20),
                Text("Creator: "+heroinfo['createdby']),
                SizedBox(height: 20),
                Text("Publisher: "+heroinfo['publisher']),
                SizedBox(height: 20),
                Text("About: "+heroinfo['bio']),
            ],
                ),
            ),
      ),
    );
  }
}
