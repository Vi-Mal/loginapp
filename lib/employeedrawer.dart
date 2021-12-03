import 'package:flutter/material.dart';
import 'package:loginapp/registeremployee.dart';

import 'getempdata.dart';

class employeeDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return employeeDrawerState();
  }
}

class employeeDrawerState extends State<employeeDrawer> {
  final minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => employeeDrawer()));
              })
        ],
      ),
      body: Center(child: getemployees()),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => registerEmployee()));
      },
      ),
    );
  }
}