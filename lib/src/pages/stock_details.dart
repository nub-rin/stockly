import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:stockly/src/utils/function.dart';
import 'package:stockly/src/models/stock.dart';

class StockPage extends StatefulWidget {
  final Stock stock;

  const StockPage({Key? key, required this.stock}) : super(key: key);

  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  List<dynamic> decodedData = [];
  List<double> decodedData2 = [];
  List<String> dates = [];
  List<int> numbers = List.generate(10685, (index) => index);
  List<dynamic> futurePredictions = [];
  List<double> futurePredictions2 = [];

  double output = 0.0;

  @override
  Widget build(BuildContext context) {
    String url = 'http://13.127.237.127:5000/stock/' + '${widget.stock.symbol}';
    String url2 = 'http://13.127.237.127:5000/stock/' +
        '${widget.stock.symbol}' +
        '/future';
    DateTime startDate = DateTime(2010, 1, 1);

    DateTime endDate = DateTime.now();
    // 2010-01-01
    for (int i = 0; i < 10685; i++) {
      dates.add(startDate.toString().substring(0, 10));
      startDate = startDate.add(Duration(days: 1));
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('${widget.stock.symbol}'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              Text(
                'Price: \$${widget.stock.price}',
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Change: ${widget.stock.change}%',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'High: \$${widget.stock.high}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Low: \$${widget.stock.low}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Open: \$${widget.stock.open}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Previous Close: \$${widget.stock.previousClose}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: ElevatedButton(
              onPressed: () async {
                var data = await fetchData(url);
                setState(() {
                  decodedData = jsonDecode(data);
                  for (int i = 0; i < decodedData.length; i++) {
                    if (i < numbers.length) {
                      decodedData2.add(decodedData[i]);
                    } else {
                      decodedData2.add(0.0);
                    }
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              child: Text(
                'Fetch closing price Graph of ${widget.stock.symbol}',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () async {
                var futureData = await fetchData(url2);
                setState(() {
                  futurePredictions = jsonDecode(futureData);

                  for (int i = 0; i < futurePredictions.length; i++) {
                    if (i < numbers.length) {
                      futurePredictions2.add(futurePredictions[i]);
                    } else {
                      futurePredictions.add(0.0);
                    }
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.lightGreen, width: 2),
                ),
              ),
              child: Text(
                'Fetch Predicted Future price Graph of ${widget.stock.symbol}',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.lightGreen,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width * 3,
                height: MediaQuery.of(context).size.height * 0.4,
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  backgroundColor: Colors.black,
                  primaryXAxis: CategoryAxis(
                    title: AxisTitle(
                        text: 'Date',
                        textStyle: TextStyle(color: Colors.white)),
                    majorGridLines: MajorGridLines(
                      color: Colors.black,
                    ),
                    minorGridLines: MinorGridLines(
                      color: Colors.black,
                    ),
                    axisLine: AxisLine(
                      color:
                          Colors.white, // Change the color of the x-axis line
                    ),
                    majorTickLines: MajorTickLines(
                      color: Colors
                          .white, // Change the color of the x-axis tick lines
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  primaryYAxis: NumericAxis(
                    title: AxisTitle(
                        text: 'Price',
                        textStyle: TextStyle(color: Colors.white)),
                    majorGridLines: MajorGridLines(
                      color: Colors.black,
                    ),
                    minorGridLines: MinorGridLines(
                      color: Colors.black,
                    ),
                    axisLine: AxisLine(width: 1), // optional: remove axis line
                    majorTickLines: MajorTickLines(
                      color: Colors
                          .white, // Change the color of the x-axis tick lines
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  title: ChartTitle(
                      text: 'Closing Price of ${widget.stock.symbol}',
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  legend: Legend(
                    isVisible: true,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <LineSeries>[
                    LineSeries<double, String>(
                      dataSource: decodedData2,
                      xValueMapper: (double x, int index) => dates[index],
                      yValueMapper: (double y, _) => y,
                      color: Colors.lightBlue,
                      enableTooltip: true,
                      name: 'Actual Price',
                    ),
                    LineSeries<double, String>(
                      dataSource: futurePredictions2,
                      xValueMapper: (double x, int index) =>
                          dates[index + decodedData2.length],
                      yValueMapper: (double y, _) => y,
                      color: Colors.lightGreen,
                      enableTooltip: true,
                      name: 'Predicted Price',
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
