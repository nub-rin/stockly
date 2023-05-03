import 'package:flutter/material.dart';

import '../models/home_trending_model.dart';
import '../utils/stock_data.dart';

class HomeTrendingList extends StatefulWidget {
  const HomeTrendingList({super.key});

  @override
  State<HomeTrendingList> createState() => _HomeTrendingListState();
}

class _HomeTrendingListState extends State<HomeTrendingList> {
  // String trendingUrl = 'http://127.0.0.1:5000/trending';
  List<String> trending = ['AAPL', 'AMZN', 'TSLA', 'GOOG', 'MSFT'];
  // late int currentPrice;
  // late int change;
  bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   getTrendingList();
  // }

  // getTrendingList() async {
  //   var data = await fetchTrendingList(trendingUrl);
  //   setState(() {
  //     trending = data['trending'];
  //     isLoading = false;
  //   });
  // }

  // getStockData(String ticker) async {
  //   String url = 'http://127.0.0.1:5000/finance/$ticker';
  //   var data = await fetchStockData(url);
  //   setState(() {
  //     currentPrice = data['current_price'];
  //     change = data['current_ratio'];
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20, left: 20),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Trending',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16.0),
        isLoading
            ? const CircularProgressIndicator()
            : SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trending.length,
                    itemBuilder: (context, index) {
                      return HomeTrendingModel(
                        ticker: trending[index],
                        tickerChangePercent: '-1.05',
                        tickerCurrentPrice: '168.54',
                        // tickerImage: 'https://picsum.photos/200/300',
                        tickerName: trending[index],
                      );
                    }))
      ],
    );
  }
}
