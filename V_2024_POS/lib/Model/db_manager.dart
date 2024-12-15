
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

    IResultSet productsSelectQuery = await conn.execute('''SELECT prd_idx
                                                                , prdName
                                                                , prdPrice
                                                             FROM products;''');

    List<Map<String, String?>> products = [
      for (var row in productsSelectQuery.rows)
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

    IResultSet ordersSelectQuery = await conn.execute(''' SELECT ord_idx
                                                               , order_dt
                                                               , order_price
                                                               , order_num
                                                            FROM orders;''');

    var orders = { for (var row in ordersSelectQuery.rows)
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

    IResultSet orderitemsSelectQuery = await conn.execute(''' SELECT oim_idx
                                                                   , prd_idx
                                                                   , ord_idx
                                                                   , quantity
                                                                   , total_price
                                                                FROM orderitems;''');

    var orderitems = { for (var row in orderitemsSelectQuery.rows)
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

  Future<void> insert_initDB() async {
    List<Map<String, String>> insertOrdersDB = [];
    List<Map<String, String>> insertOrderitemsDB = [];
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

    IResultSet ordersQuery = await conn.execute('''INSERT INTO orders 
                                                        ( order_dt
                                                        , order_price)
                                                  VALUES
                                                        ( %s
                                                        , %s)''');

    // orderitems - oim_idx(아이템 테이블 primary KEY - AI), prd_idx(제품 번호 - table = products), 
    // ord_idx(주문 번호 - table = orders), quantity(제품 주문 개수 - 해당 제품), total_price(해당 제품 총액)
    IResultSet orderitemsInsertQuery = await conn.execute('''INSERT INTO orderitems
                                                             SELECT 0
                                                                  , (SELECT prd_idx
                                                               FROM products
                                                              WHERE prdName = %s)
                                                                  , (SELECT ord_idx
                                                               FROM orders
                                                              ORDER BY ord_idx DESC LIMIT 1)
                                                                  , %s
                                                                  , %s ''');
    var insertOrders = { 
      for (var row in ordersQuery.rows)
        row.colAt(0): {
          'order_dt': row.colAt(1),
          'order_price': row.colAt(2),
        }
    };

    var insertOrderitems = { 
      for (var row in ordersQuery.rows)
        row.colAt(0): {
          'prd_idx': row.colAt(1),
          'ord_idx': row.colAt(2),
          'quantity': row.colAt(3),
          'total_price': row.colAt(4),
        }
    };


    await conn.close();

    print(insertOrders);
    print('---------------------------------------------');
  }

}

