import 'package:mysql_client/mysql_client.dart';
import 'package:possystem/main.dart';

class MySqlConnector {
  Future<void> GetProducts(String query) async {
    print("Connecting to MySQL server...");

    // MySQL 접속 설정
    final conn = await MySQLConnection.createConnection(
      host: '127.0.0.1',
      port: 3306,
      userName: 'root',
      password: '12345',
      databaseName: 'calckiosk_new',
    );

    await conn.connect();

    print("Connected");

    var mysqlProducts = await conn.execute(query);

    
    for (final row in mysqlProducts.rows) {

      // 쿼리 실행 결과의 모든 내용 출력
      print(row.assoc());
    }

    await conn.close();
  }
}
