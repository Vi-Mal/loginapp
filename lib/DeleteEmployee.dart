import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'EmployeeModel.dart';
import 'getempdata.dart';

class deleteEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return deleteEmployeeState();
  }
}

Future<EmployeeModel> deleteEmployees(String firstName, String lastName) async {
  var Url = "http://localhost:8080/deleteemployee";
  var response = await http.delete(
    Uri.parse(Url),
    headers: <String, String>{
      "Content-Type": "application/json;charset=UTF-8,"
    },
  );
  return EmployeeModel.fromJson(jsonDecode(response.body));
}

class deleteEmployeeState extends State<deleteEmployee> {
  @override
  Widget build(BuildContext context) {
    return getemployees();
  }
}