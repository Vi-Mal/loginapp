import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'databaseConnect.dart';

class displatDBdata extends StatefulWidget {
  const displatDBdata({Key? key}) : super(key: key);

  @override
  _displatDBdataState createState() => _displatDBdataState();
}

class _displatDBdataState extends State<displatDBdata> {

  var db = new Mysql();
  var mail= 'empty';

  void _getCustomer() {
    db.getConnection().then((conn) {
      String sql = 'SELECT user_mail FROM user_info.user_login';
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            mail = row[0];
          });
        }
      });
      conn.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'mail: $mail',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCustomer,
        child: Icon(Icons.add),
      ),
    );
  }
}
