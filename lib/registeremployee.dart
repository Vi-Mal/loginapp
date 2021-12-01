import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'EmployeeModel.dart';

class registerEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registerEmployeeState();
  }
}

registerEmployees(
    String firstName, String lastName, BuildContext context) async {
  var Url = 'http://localhost:8080/addemployee';
  var response = await http.post(Uri.parse(Url),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "firstName": firstName,
        "lastName": lastName,
      }));

  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: 'Backend Response', content: response.body);
      },
    );
  }
}

class registerEmployeeState extends State<registerEmployee> {
  final minimumPadding = 5.0;

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();

  late EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Employee"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        hintText: 'Enter Your First Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'Enter Your First Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              RaisedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    String firstName = firstController.text;
                    String lastName = lastController.text;
                    EmployeeModel employees =
                    await registerEmployees(firstName, lastName, context);
                    firstController.text = '';
                    lastController.text = '';
                    setState(() {
                      employee = employees;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    required this.title,
    required this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
      ),
      actions: this.actions,
      content: Text(
        this.content,
      ),
    );
  }
}