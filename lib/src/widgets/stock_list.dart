import 'package:flutter/material.dart';
import 'package:stockly/src/pages/stock_details.dart';
import 'package:stockly/src/utils/user_data.dart';

import '../models/stock.dart';

class StockList extends StatefulWidget {
  final List<Stock> stocks;

  const StockList({Key? key, required this.stocks}) : super(key: key);

  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  List<bool> _isFavoriteList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the list of favorite states to false for each stock
    _isFavoriteList = List.generate(widget.stocks.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey[500]);
      },
      itemCount: widget.stocks.length,
      itemBuilder: (context, index) {
        final stock = widget.stocks[index];

        return GestureDetector(
          onTap: () {
            // Push a new Stock page onto the navigation stack
            Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => StockPage(stock: stock),
                builder: (context) => StockPage(
                  stock: stock,
                ),
              ),
            );
          },
          child: ListTile(
            // contentPadding: const EdgeInsets.all(10.0),
            contentPadding: const EdgeInsets.only(bottom: 10.0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${stock.symbol}",
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                Text("${stock.company}",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w300))
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("\$${stock.price}",
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                const SizedBox(width: 10),
                Container(
                  width: 50,
                  height: MediaQuery.of(context).size.height * 0.021,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "${stock.change}%",
                      style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    UserData().addFavorite('${stock.symbol}');
                    setState(() {
                      _isFavoriteList[index] = !_isFavoriteList[index];
                    });
                  },
                  child: Icon(
                    _isFavoriteList[index]
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: _isFavoriteList[index] ? Colors.red : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
