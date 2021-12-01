import 'package:mysql1/mysql1.dart';

class Mysql {

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: '127.0.0.1',
        port: 3306,
        user: 'dbuser',
        password: 'password',
        db: 'user_info',
    );
    return await MySqlConnection.connect(settings);
  }
}