import 'package:flutter/material.dart';

class HomeTrendingModel extends StatefulWidget {
  final String ticker;
  final String tickerName;
  // final String tickerImage;
  final String tickerCurrentPrice;
  final String tickerChangePercent;

  const HomeTrendingModel({
    super.key,
    required this.ticker,
    required this.tickerName,
    // required this.tickerImage,
    required this.tickerCurrentPrice,
    required this.tickerChangePercent,
  });

  @override
  State<HomeTrendingModel> createState() => _HomeTrendingModelState();
}

class _HomeTrendingModelState extends State<HomeTrendingModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 250,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.tickerName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                widget.tickerCurrentPrice,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          const Spacer(
            flex: 1,
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
                '(${widget.tickerChangePercent}%)',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
