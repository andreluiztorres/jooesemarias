import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = '192.185.216.181',
      user = 'r1sys360_jm',
      password = 'M@teult1',
      db = 'r1sys360_jm';
  static int port = 3306;
  
  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
