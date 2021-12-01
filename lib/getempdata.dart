import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/registeremployee.dart';
import 'DeleteEmployee.dart';
import 'EmployeeModel.dart';
import 'updateemployee.dart';

class getemployees extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return getAllEmployeesState();
  }
}

class getAllEmployeesState extends State<getemployees> {
  List<EmployeeModel> employee = [];
  var xy ;


  Future<List<EmployeeModel>> getEmployees() async {

    var data = await http.get(Uri.parse('http://localhost:8080/getallemployees'));
    var jsonData = jsonDecode(data.body);
    xy =jsonData;



    employee = [];
    for (var e in jsonData) {
      EmployeeModel employees = new EmployeeModel(firstName: e["firstName"] , lastName: e["lastName"], id: e["id"]);
      employee.add(employees);
    }
    return employee;
  }

  @override
  Widget build(BuildContext context) {
    print(xy);
    return Scaffold(
      appBar:  AppBar(
        title:  Text("All Employees Details"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getEmployees(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Icon(Icons.error)));
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('${snapshot.data[index].id}       ' +
                        '${snapshot.data[index].firstName}       ' +
                        '${snapshot.data[index].lastName}'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));
                    },
                  );
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => registerEmployee()));
      },child: Icon(Icons.ten_k),

      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  EmployeeModel employee;

  DetailPage(this.employee);

  deleteEmployee1(EmployeeModel employee) async {
    final url = Uri.parse('http://localhost:8080/deleteemployee');
    final request = http.Request("DELETE", url);
    request.headers
        .addAll(<String, String>{"Content-type": "application/json"});
    request.body = jsonEncode(employee);
    final response = await request.send();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.firstName),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => updateEmployee(employee)));
              })
        ],
      ),
      body: Container(
        child: Text('FirstName' +
            ' ' +
            employee.firstName +
            ' ' +
            'LastName' +
            employee.lastName),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          deleteEmployee1(employee);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => deleteEmployee()));
        },
        child: Icon(Icons.delete),
        backgroundColor: Colors.pink,
      ),
    );
  }

}