// import 'package:flutter/material.dart';

// class Stock {
//   final String? company;
//   final String? symbol;
//   final double? price;
//   final double? change;
//   final bool? isFavorite;

//   Stock({this.company, this.symbol, this.price, this.change, this.isFavorite});

//   static List<Stock> getAll() {
//     List<Stock> stocks = [];

//     stocks
//         .add(Stock(company: "Tesla", symbol: "TSLA", price: 300, change: 2.0));
//     stocks.add(
//         Stock(company: "Amazon", symbol: "AMZN", price: 1800, change: 1.0));
//     stocks
//         .add(Stock(company: "Apple", symbol: "APPL", price: 258, change: 3.0));
//     // stocks.add(
//     //     Stock(company: "Alphabet", symbol: "ALPH", price: 800, change: 4.0));
//     // stocks.add(Stock(
//     //     company: "General Electronic",
//     //     symbol: "GE",
//     //     price: 56.00,
//     //     change: 5.0));
//     // stocks.add(
//     //     Stock(company: "Home Depot", symbol: "HE", price: 178, change: 6.0));
//     // stocks.add(Stock(
//     //     company: "Evergreen Solar", symbol: "EVR", price: 9.0, change: 7.0));
//     // stocks
//     //     .add(Stock(company: "Facebook", symbol: "FB", price: 200, change: 8.0));
//     // stocks
//     //     .add(Stock(company: "Samsung", symbol: "SAM", price: 134, change: 9.0));
//     // stocks.add(
//     //     Stock(company: "Snapchat", symbol: "SNAP", price: 45, change: 10.0));
//     stocks.add(
//         Stock(company: "Microsoft", symbol: "MSFT", price: 400, change: 11.0));
//     stocks.add(
//         Stock(company: "Google", symbol: "GOOG", price: 1800, change: 12.0));

//     return stocks;
//   }
// }
// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class Stock {
//   final String? symbol;
//   final String? date;
//   final double? open;
//   final double? high;
//   final double? low;
//   final double? close;
//   final int? volume;

//   Stock({
//     this.symbol,
//     this.date,
//     this.open,
//     this.high,
//     this.low,
//     this.close,
//     this.volume,
//   });

//   static Future<List<Stock>> getAll() async {
//     final url = Uri.parse(
//         'https://mboum-finance.p.rapidapi.com/hi/history?symbol=AAPL&interval=15m&diffandsplits=false');

//     final headers = {
//       'X-RapidAPI-Key': '109cc2a367msh997f1cf12a41d0ap16e59bjsn2c2c6a655460',
//       'X-RapidAPI-Host': 'mboum-finance.p.rapidapi.com'
//     };

//     final response = await http.get(url, headers: headers);

//     if (response.statusCode == 200) {
//       final jsonBody = json.decode(response.body);

//       final List<Stock> stocks = [];

//       for (final item in jsonBody['items'].values) {
//         final stock = Stock(
//           symbol: jsonBody['meta']['symbol'],
//           date: item['date'],
//           open: item['open'].toDouble(),
//           high: item['high'].toDouble(),
//           low: item['low'].toDouble(),
//           close: item['close'].toDouble(),
//           volume: item['volume'],
//         );

//         stocks.add(stock);
//       }

//       return stocks;
//     } else {
//       throw Exception('Failed to load stocks');
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Stock {
//   final String? company;
//   final String? symbol;
//   final double? price;
//   final double? change;
//   final bool? isFavorite;

//   Stock({this.company, this.symbol, this.price, this.change, this.isFavorite});

//   static Future<List<Stock>> getAll() async {
//     final response = await http.get(
//         Uri.parse(
//             'https://mboum-finance.p.rapidapi.com/hi/history?symbol=AAPL&interval=15m&diffandsplits=false'),
//         headers: {
//           'X-RapidAPI-Key':
//               '109cc2a367msh997f1cf12a41d0ap16e59bjsn2c2c6a655460',
//           'X-RapidAPI-Host': 'mboum-finance.p.rapidapi.com'
//         });

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final meta = data['meta'];
//       final items = data['items'];
//       final List<Stock> stocks = [];

//       items.forEach((key, value) {
//         stocks.add(
//           Stock(
//             company: meta['exchangeName'],
//             symbol: meta['symbol'],
//             price: value['close'].toDouble(),
//             change: (value['close'] - value['open']).toDouble(),
//             isFavorite: false,
//           ),
//         );
//       });

//       return stocks;
//     } else {
//       throw Exception('Failed to fetch stocks');
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Stock {
  final String? company;
  final String? symbol;
  final double? price;
  final double? change;
  final bool isFavorite = false;

  set isFavorite(bool value) {
    this.isFavorite = value;
  }

  Stock({this.company, this.symbol, this.price, this.change});

  static Future<List<Stock>> getAll() async {
    final List<String> symbols = [
      'AAPL',
      'MSFT',
      'GOOGL',
      'AMZN',
      'NVDA',
    ];
    final List<Stock> stocks = [];
    final List<String> Name = [
      'APPLE',
      'MICROSOFT',
      'GOOGLE',
      'AMAZON',
      'NVIDIA',
    ];

    for (final symbol in symbols) {
      final response = await http.get(
        Uri.parse(
          'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$symbol&apikey=YOUR_API_KEY',
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final quote = data['Global Quote'];

        stocks.add(
          Stock(
            company: Name[symbols.indexOf(symbol)],
            symbol: symbol,
            price: double.parse(quote['05. price']),
            change: double.parse(quote['09. change']),
          ),
        );
      } else {
        throw Exception('Failed to fetch stocks');
      }
    }

    return stocks;
  }
}
