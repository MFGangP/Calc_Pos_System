import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';

class MySqlConnector {
  // 공통 MySQL 연결 생성 함수
  Future<MySQLConnection> _createConnection() async {
    final conn = await MySQLConnection.createConnection(
      host: '127.0.0.1',
      port: 3306,
      userName: 'root',
      password: '12345',
      databaseName: 'calckiosk_new',
    );
    await conn.connect();
    print("Connected");
    return conn;
  }

  // DB 접속 및 products 초기화
  Future<List<Map<String, String?>>> productsData() async {
    final conn = await _createConnection();
    IResultSet productsSelectQuery = await conn.execute('''SELECT prdIdx
                                                                , prdName
                                                                , prdPrice
                                                             FROM products;''');

    List<Map<String, String?>> products = [
      for (var row in productsSelectQuery.rows)
        {
          'prdIdx': row.colAt(0),
          'prdName': row.colAt(1),
          'prdPrice': row.colAt(2),
        }
    ];

    await conn.close();
    // print('products---------------------------------------------');
    // print(products);

    return products;
  }

  // 오늘 제품 주문 기록 전체 다 불러오기 위한 DB쿼리문
  Future<List<Map<String, dynamic>>> ordersAllData() async {
    final conn = await _createConnection();

    /*
      orders (주문번호처리)
      idx, 
      주문 날짜, 
      주문 가격
      ord_idx, 
      order_dt, 
      order_price
    */

    IResultSet ordersSelectQuery = await conn.execute('''SELECT oim.ordIdx
                                                              , ods.orderNum
                                                              , prd.prdName
                                                              , prd.prdPrice
                                                              , oim.quantity
                                                              , oim.totalPrice 
                                                              , ods.orderPrice
                                                              , ods.orderDt
                                                              , ods.orderState
                                                           FROM calckiosk_new.orderitems as oim
                                                          INNER JOIN calckiosk_new.orders as ods
                                                             ON oim.ordIdx = ods.ordIdx
                                                          INNER JOIN calckiosk_new.products as prd
                                                             ON prd.prdIdx = oim.prdIdx
                                                          WHERE DATE(ods.orderDt) = CURDATE()''');

    var orders = <Map<String, dynamic>>[];

    for (var row in ordersSelectQuery.rows) {
      orders.add({
        'ordIdx': row.colAt(0),
        'orderNum': row.colAt(1),
        'prdName': row.colAt(2),
        'prdPrice': row.colAt(3),
        'quantity': row.colAt(4),
        'totalPrice': row.colAt(5),
        'orderPrice': row.colAt(6),
        'orderDt': row.colAt(7),
        'orderState': row.colAt(8),
      });
    }

    // debugPrint('$orders');

    await conn.close();
    return orders;
  }

  // // 오늘의 주문 기록 내 주문 상황에 따른 값을 받기 위한 DB 쿼리문
  // Future<List<Map<String, dynamic>>> ordersStateData(int orderState) async {
  //   final conn = await _createConnection();

  //   /*
  //     orders (주문번호처리)
  //     idx,
  //     주문 날짜,
  //     주문 가격
  //     ord_idx,
  //     order_dt,
  //     order_price
  //   */

  //   IResultSet ordersSelectQuery = await conn.execute('''SELECT oim.ordIdx
  //                                                             , ods.orderNum
  //                                                             , prd.prdName
  //                                                             , prd.prdPrice
  //                                                             , oim.quantity
  //                                                             , oim.totalPrice
  //                                                             , ods.orderPrice
  //                                                             , ods.orderDt
  //                                                             , ods.orderState
  //                                                          FROM calckiosk_new.orderitems as oim
  //                                                         INNER JOIN calckiosk_new.orders as ods
  //                                                            ON oim.ordIdx = ods.ordIdx
  //                                                         INNER JOIN calckiosk_new.products as prd
  //                                                            ON prd.prdIdx = oim.prdIdx
  //                                                         WHERE DATE(ods.orderDt) = CURDATE()
  //                                                           AND ods.orderState = $orderState;''');

  //   var orders = <Map<String, dynamic>>[];

  //   for (var row in ordersSelectQuery.rows) {
  //     orders.add({
  //       'ordIdx': row.colAt(0),
  //       'orderNum': row.colAt(1),
  //       'prdName': row.colAt(2),
  //       'prdPrice': row.colAt(3),
  //       'quantity': row.colAt(4),
  //       'totalPrice': row.colAt(5),
  //       'orderPrice': row.colAt(6),
  //       'orderDt': row.colAt(7),
  //       'orderState': row.colAt(8),
  //     });
  //   }

  //   // debugPrint('$orders');

  //   await conn.close();
  //   return orders;
  // }

  // 오늘 주문 기록의 특정 주문 번호 기록을 받기 위한 DB 쿼리문
  Future<List<Map<String, dynamic>>> ordersNumData(int orderNum) async {
    final conn = await _createConnection();

    /*
      orders (주문번호처리)
      idx, 
      주문 날짜, 
      주문 가격
      ord_idx, 
      order_dt, 
      order_price
    */

    IResultSet ordersSelectQuery = await conn.execute('''SELECT oim.ordIdx
                                                              , ods.orderNum
                                                              , prd.prdName
                                                              , prd.prdPrice
                                                              , oim.quantity
                                                              , oim.totalPrice 
                                                              , ods.orderPrice
                                                              , ods.orderDt
                                                              , ods.orderState
                                                           FROM calckiosk_new.orderitems as oim
                                                          INNER JOIN calckiosk_new.orders as ods
                                                             ON oim.ordIdx = ods.ordIdx
                                                          INNER JOIN calckiosk_new.products as prd
                                                             ON prd.prdIdx = oim.prdIdx
                                                          WHERE DATE(ods.orderDt) = CURDATE()
                                                            AND ods.orderNum = $orderNum;''');

    var orders = <Map<String, dynamic>>[];

    for (var row in ordersSelectQuery.rows) {
      orders.add({
        'ordIdx': row.colAt(0),
        'orderNum': row.colAt(1),
        'prdName': row.colAt(2),
        'prdPrice': row.colAt(3),
        'quantity': row.colAt(4),
        'totalPrice': row.colAt(5),
        'orderPrice': row.colAt(6),
        'orderDt': row.colAt(7),
        'orderState': row.colAt(8),
      });
    }

    // debugPrint('$orders');

    await conn.close();
    return orders;
  }

  // 오늘 날짜에 주문 된 주문 기록(주문 상태에 따른 기록)을 받기 위한 DB 쿼리문
  Future<List<Map<String, dynamic>>> ordersStateDataToday(int orderState) async {
    final conn = await _createConnection();
    /*
      orders (주문번호처리)
      idx, 주문 날짜, 주문 가격
      ord_idx, order_dt, order_price
    */
    IResultSet ordersSelectQuery = await conn.execute(''' SELECT ordIdx
                                                               , orderDt
                                                               , orderPrice
                                                               , orderNum
                                                               , orderState
                                                            FROM calckiosk_new.orders
                                                           WHERE DATE(orderDt) = CURDATE()
                                                             AND orderState = $orderState;''');

    // 데이터를 리스트로 변환
    var orders = <Map<String, dynamic>>[];

    for (var row in ordersSelectQuery.rows) {
      orders.add({
        'ordIdx': row.colAt(0),
        'orderDt': row.colAt(1),
        'orderPrice': row.colAt(2),
        'orderNum': row.colAt(3),
        'orderState': row.colAt(4),
      });
    }

    // debugPrint('$orders');
    await conn.close();

    return orders;
  }

  // 오늘 날짜에 주문된 주문 기록(전체)를 받기 위한 DB 쿼리문
  Future<List<Map<String, dynamic>>> ordersDataToday() async {
    final conn = await _createConnection();
    /*
      orders (주문번호처리)
      idx, 주문 날짜, 주문 가격
      ord_idx, order_dt, order_price
    */
    IResultSet ordersSelectQuery = await conn.execute(''' SELECT ordIdx
                                                               , orderDt
                                                               , orderPrice
                                                               , orderNum
                                                               , orderState
                                                            FROM orders
                                                           WHERE DATE(orderDt) = CURDATE();''');

    // 데이터를 리스트로 변환
    var orders = <Map<String, dynamic>>[];

    for (var row in ordersSelectQuery.rows) {
      orders.add({
        'ordIdx': row.colAt(0),
        'orderDt': row.colAt(1),
        'orderPrice': row.colAt(2),
        'orderNum': row.colAt(3),
        'orderState': row.colAt(4),
      });
    }

    // debugPrint('$orders');
    await conn.close();

    return orders;
  }

  // 오늘 날짜에 주문된 마지막 주문 번호(가장 최신 번호)를 받기 위한 DB 쿼리문 - insert 검증에 사용
  Future<Map<String, String?>> orderNumToday() async {
    final conn = await _createConnection();

    /*
      orders (주문번호처리)
      idx, 주문 날짜, 주문 가격
      ord_idx, order_dt, order_price
    */

    IResultSet ordersSelectQuery = await conn.execute('''SELECT MAX(orderNum) as orderNum
                                                           FROM calckiosk_new.orders
                                                          WHERE DATE(orderDt) = CURDATE();''');

    var orderNums = {for (var row in ordersSelectQuery.rows) 'orderNum': row.colAt(0)};

    // debugPrint('$orderNums');
    await conn.close();
    return orderNums;
  }

  // 제품 가격 정보 받기 위한 DB 쿼리문
  Future<Map<String?, Map<String, String?>>> orderitemsData() async {
    final conn = await _createConnection();

    /* 
      제품 가격 불러와서 설정하기
        orderitems (단품 전체 가격)
        idx, 제품 번호, 주문 번호, 개수, 총가격
        oim_idx, prd_idx, ord_idx, quantity, total_price
    */

    IResultSet orderitemsSelectQuery = await conn.execute(''' SELECT oimIdx
                                                                   , prdIdx
                                                                   , ordIdx
                                                                   , quantity
                                                                   , totalPrice
                                                                FROM orderitems;''');

    var orderitems = {
      for (var row in orderitemsSelectQuery.rows)
        row.colAt(0): {
          'oimIdx': row.colAt(0),
          'prdIdx': row.colAt(1),
          'ordIdx': row.colAt(2),
          'quantity': row.colAt(3),
          'totalPrice': row.colAt(4),
        }
    };

    await conn.close();
    // print(orderitems);
    // print('---------------------------------------------');
    return orderitems;
  }

  // 주문 정보 등록
  Future<void> insertOrderData(String orderDt, int orderPrice, List<Map<String, dynamic>> orderList) async {
    final conn = await _createConnection();

    int orderNum = 0;

    // ordersDataToday 함수 호출 및 결과 받기
    Map<String, String?> orderNumDB = await orderNumToday();

    // 리스트가 비어있는지 확인
    if (orderNumDB['orderNum'] == null) {
      orderNum = 1;
    } else {
      orderNum += int.parse(orderNumDB['orderNum'] ?? 'orderNum') + 1;
    }

    // orders 테이블에 데이터 삽입
    await conn.execute('''INSERT INTO orders 
                          (orderDt, orderPrice, orderNum, orderState)
                        VALUES
                          ('$orderDt', $orderPrice, $orderNum, 0)''');

    /*
    orderitems 테이블에 데이터 삽입
      orderitems - oim_idx(아이템 테이블 primary KEY - AI), prd_idx(제품 번호 - table = products), 
      ord_idx(주문 번호 - table = orders), quantity(제품 주문 개수 - 해당 제품), total_price(해당 제품 총액)
  */
    for (int index = 0; index < orderList.length; index += 1) {
      await conn.execute('''INSERT INTO orderitems
                        SELECT 0
                             , (SELECT prdIdx 
                                  FROM products 
                                  WHERE prdName = '${orderList[index]['prdName']}')
                             , (SELECT ordIdx 
                                FROM orders 
                                ORDER BY ordIdx DESC LIMIT 1)
                             , ${orderList[index]['prdCount']}
                             , ${orderList[index]['prdPrice'] * orderList[index]['prdCount']}''');
    }

    await conn.close();

    debugPrint('주문 정보 등록 완료');
  }

  Future<bool> updateProductData(int prdIdx, String prdName, int prdPrice) async {
    try {
      final conn = await _createConnection();

      // SQL 실행
      var result = await conn.execute('''UPDATE products
                                            SET prdPrice = $prdPrice, prdName = '$prdName'
                                          WHERE prdIdx = $prdIdx;''');

      await conn.close();

      // 업데이트된 행의 개수 확인
      if (result.isNotEmpty) {
        debugPrint('제품 정보 업데이트 성공 (수정된 행: ${result.affectedRows})');
        return true;
      } else {
        debugPrint('제품 정보 업데이트 실패: 해당 제품 ID($prdIdx)가 없습니다.');
        return false;
      }
    } catch (e) {
      // 예외 처리
      debugPrint('제품 정보 업데이트 중 오류 발생: $e');
      return false;
    }
  }

  ordersStateDataUpdate(int ordIdx) async {
    final conn = await _createConnection();

    await conn.execute('''UPDATE calckiosk_new.orders
                             SET orderState = 1
                           WHERE DATE(orderDt) = CURDATE()
                             AND ordIdx = $ordIdx;''');

    await conn.close();

    debugPrint('주문 상태 정보 수정 완료');
  }
}
