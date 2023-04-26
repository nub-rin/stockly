import 'package:flutter/material.dart';

import '../utils/stock_data.dart';

class HomeFavModel extends StatefulWidget {
  final String ticker;

  const HomeFavModel({
    super.key,
    required this.ticker,
  });

  @override
  State<HomeFavModel> createState() => _HomeFavModelState();
}

class _HomeFavModelState extends State<HomeFavModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 190,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(20),
      child: FutureBuilder(
          future: StockData().fetchStockData(widget.ticker),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
              );
            }
            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("Document does not exist");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Row(
                    children: [
                      Image.network(
                        'https://i.imgur.com/removed.png',
                        width: 30,
                        height: 30,
                      ),
                      // space
                      const Spacer(
                        flex: 1,
                      ),
                      const Text(
                        'graph placeholder',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        snapshot.data['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        '${snapshot.data['currency']}${snapshot.data['price']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.ticker,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        '(${snapshot.data['percent_change']}%)',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
