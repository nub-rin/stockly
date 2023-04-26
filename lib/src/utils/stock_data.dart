import 'dart:convert';
import "dart:io";

import 'package:http/http.dart' as http;

class StockData {
  final url = 'http://localhost:5000/';
  
  Future<http.Response> fetchStockData(String ticker) async {
    return http.get(Uri.parse('$url$ticker'));
  }
}

class 