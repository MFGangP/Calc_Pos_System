import 'package:mysql_client/mysql_client.dart';

class MySqlConnector {
  Future<List<Map<String, String?>>> Products_initDB() async {
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

    IResultSet products_SELECT_Query = await conn.execute('''SELECT prd_idx
                                                                  , prdName
                                                                  , prdPrice
                                                               FROM products;''');

    List<Map<String, String?>> products = [
      for (var row in products_SELECT_Query.rows)
        {
          'prdName': row.colAt(1),
          'prdPrice': row.colAt(2),
        }
    ];

    await conn.close();

    print('products---------------------------------------------');
    print(products);

    return products;
  }

  Future<Map<String?, Map<String, String?>>> orders_initDB() async {
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

    IResultSet orders_SELECT_Query = await conn.execute(''' SELECT ord_idx
                                                                 , order_dt
                                                                 , order_price
                                                                 , order_num
                                                              FROM orders;''');

    var orders = { for (var row in orders_SELECT_Query.rows)
      row.colAt(0): {
        'order_dt': row.colAt(1),
        'order_price': row.colAt(2),
        'order_num': row.colAt(3)
      }
    };

    await conn.close();

    print(orders);
    print('---------------------------------------------');
    return orders;
  }

  Future<Map<String?, Map<String, String?>>> orderitems_initDB() async {
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

    IResultSet orderitems_SELECT_Query = await conn.execute(''' SELECT oim_idx
                                                                     , prd_idx
                                                                     , ord_idx
                                                                     , quantity
                                                                     , total_price
                                                                  FROM orderitems;''');

    var orderitems = { for (var row in orderitems_SELECT_Query.rows)
      row.colAt(0): {
        'prd_idx': row.colAt(1),
        'ord_idx': row.colAt(2),
        'quantity': row.colAt(3),
        'total_price': row.colAt(4),
      }
    };


    await conn.close();

    print(orderitems);
    print('---------------------------------------------');
    return orderitems;
  }
}

