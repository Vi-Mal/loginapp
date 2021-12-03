import 'dart:convert';
import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/employeedrawer.dart';
import 'package:loginapp/updateemployee.dart';
import 'EmployeeModel.dart';

class getemployees extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return getAllEmployeesState();
  }
}

class getAllEmployeesState extends State<getemployees> {

  Future<List<EmployeeModel>> getEmployees() async {
    var data = await http.get(Uri.parse('http://localhost:8080/getallemployees'));
    var jsonData = json.decode(data.body);

    List<EmployeeModel> employee = [];
    for (var e in jsonData) {
      EmployeeModel employees = new EmployeeModel(id: e["id"], lastName: e["lastName"], firstName: e["firstName"]);
      employee.add(employees);
    }
    return employee;
  }

  @override
  Widget build(BuildContext context) {
    return Container(

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
                    title: Container(
                      child: Column(
                        children: [
                          Container(
                            child: ListTile(
                              title: Text("firstname: " + snapshot.data[index].firstName),
                              subtitle: Row(
                                children: [
                                  Text("lastname: " + snapshot.data[index].lastName),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
      body: Container(),
      // Center(
      //   child: Container(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children:[
      //         Text('FirstName:  ' +
      //             employee.firstName ),
      //             Text(
      //             'LastName:  ' +
      //             employee.lastName),
      //       ]
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          deleteEmployee1(employee);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => employeeDrawer()));
          showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogContext) {
          return MyAlertDialog(
          title: 'deleted',
            actions: <Widget>[
              TextButton(
                child: const Text('done'),
                onPressed: () {
            },
              ),
            ], content: 'deleted item',
          );
          });
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}