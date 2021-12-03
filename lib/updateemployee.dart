import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'EmployeeModel.dart';
import 'employeedrawer.dart';

class updateEmployee extends StatefulWidget {
  EmployeeModel employee;

  @override
  State<StatefulWidget> createState() {
    return updateEmployeeState(employee);
  }

  updateEmployee(this.employee);
}

Future updateEmployees(
    EmployeeModel employee, BuildContext context) async {
  var Url = "http://localhost:8080/updateemployee";
  var response = await http.put(Uri.parse(Url),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(employee));
  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog(
              title: 'Backend Response', content: response.body);
        });
  }
}

class updateEmployeeState extends State<updateEmployee> {
  late EmployeeModel employee;
  final minimumPadding = 5.0;
  late TextEditingController employeeNumber;
  bool _isEnabled = false;
  late TextEditingController firstController;
  late TextEditingController lastController;
  late Future<List<EmployeeModel>> employees;

  updateEmployeeState(this.employee) {
    employeeNumber = TextEditingController(text: this.employee.id.toString());
    firstController = TextEditingController(text: this.employee.firstName);
    lastController = TextEditingController(text: this.employee.lastName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Employee'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => employeeDrawer()));
            },
          ),
        ),
        body: Container(
            child: Padding(
                padding: EdgeInsets.all(minimumPadding * 2),
                child: ListView(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: minimumPadding, bottom: minimumPadding),
                      child: TextFormField(
                        controller: employeeNumber,
                        enabled: _isEnabled,
                        decoration: InputDecoration(
                            labelText: 'Employee ID',
                            hintText: 'Enter Employee ID',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: minimumPadding, bottom: minimumPadding),
                      child: TextFormField(
                        controller: firstController,
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
                        controller: lastController,
                        decoration: InputDecoration(
                            labelText: 'Last Name',
                            hintText: 'Enter Your First Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  ElevatedButton(
                      child: Text('Update Details'),
                      onPressed: () async {
                        String firstName = firstController.text;
                        String lastName = lastController.text;
                        EmployeeModel emp = new EmployeeModel(lastName: lastController.text, id: employee.id, firstName: firstController.text);
                        EmployeeModel employees =
                        await updateEmployees(emp, context);
                        setState(() {
                          employee = employees;
                        });
                      })
                ]))));
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