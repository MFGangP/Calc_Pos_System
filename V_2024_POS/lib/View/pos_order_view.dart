import 'package:flutter/material.dart';
import 'package:possystem/Model/db_connector.dart';

  var products = MySqlConnector().Products_initDB();
  var orders = MySqlConnector().orders_initDB();
  var orderitems = MySqlConnector().orderitems_initDB();