import 'package:flutter/material.dart';

class Stock {
  final String? company;
  final String? symbol;
  final double? price;
  final double? change;
  final bool? isFavorite;

  Stock({this.company, this.symbol, this.price, this.change, this.isFavorite});

  static List<Stock> getAll() {
    List<Stock> stocks = [];

    stocks
        .add(Stock(company: "Tesla", symbol: "TSLA", price: 300, change: 2.0));
    stocks.add(
        Stock(company: "Amazon", symbol: "AMZN", price: 1800, change: 1.0));
    stocks
        .add(Stock(company: "Apple", symbol: "APPL", price: 258, change: 3.0));
    // stocks.add(
    //     Stock(company: "Alphabet", symbol: "ALPH", price: 800, change: 4.0));
    // stocks.add(Stock(
    //     company: "General Electronic",
    //     symbol: "GE",
    //     price: 56.00,
    //     change: 5.0));
    // stocks.add(
    //     Stock(company: "Home Depot", symbol: "HE", price: 178, change: 6.0));
    // stocks.add(Stock(
    //     company: "Evergreen Solar", symbol: "EVR", price: 9.0, change: 7.0));
    // stocks
    //     .add(Stock(company: "Facebook", symbol: "FB", price: 200, change: 8.0));
    // stocks
    //     .add(Stock(company: "Samsung", symbol: "SAM", price: 134, change: 9.0));
    // stocks.add(
    //     Stock(company: "Snapchat", symbol: "SNAP", price: 45, change: 10.0));
    stocks.add(
        Stock(company: "Microsoft", symbol: "MSFT", price: 400, change: 11.0));
    stocks.add(
        Stock(company: "Google", symbol: "GOOG", price: 1800, change: 12.0));

    return stocks;
  }
}
