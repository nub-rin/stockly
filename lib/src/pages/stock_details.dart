// import 'package:flutter/material.dart';
// import '../models/stock.dart';

// class StockPage extends StatelessWidget {
//   final Stock stock;

//   const StockPage({Key? key, required this.stock}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${stock.symbol}'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Name: ${stock.company}',
//                 style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16.0),
//               Text(
//                 'Price: \$${stock.price}',
//                 style: const TextStyle(fontSize: 18.0),
//               ),
//               const SizedBox(height: 8.0),
//               Text(
//                 'Change: ${stock.change}%',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   color: Colors.red,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
  // String url = 'http://127.0.0.1:8000/stock/${widget.stock.company}';
  // String url2 = 'http://127.0.0.1:8000/stock/${widget.stock.company}/future';
  // String url =
  //     'http://ec2-54-95-231-4.ap-northeast-1.compute.amazonaws.com/stock/amzn';
  // String url2 =
  //     'http://ec2-54-95-231-4.ap-northeast-1.compute.amazonaws.com/stock/amzn/future';
  List<dynamic> decodedData = [];
  List<double> decodedData2 = [];
  List<String> dates = [];
  List<int> numbers = List.generate(1258, (index) => index);
  List<dynamic> futurePredictions = [];
  List<double> futurePredictions2 = [];

  double output = 0.0;

  @override
  Widget build(BuildContext context) {
    String url = 'http://127.0.0.1:8000/stock/' + '${widget.stock.company}';
    String url2 = 'http://127.0.0.1:8000/stock/${widget.stock.company}/future';
    DateTime startDate = DateTime(2018, 4, 30);
    for (int i = 0; i < 1288; i++) {
      dates.add(startDate.toString().substring(0, 10));
      startDate = startDate.add(Duration(days: 1));
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('${widget.stock.company}'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Name: ${widget.stock.company}',
                style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
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
            ],
          ),
          TextButton(
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
            child: Text(
              'Fetch closing price Graph of ${widget.stock.company}',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  backgroundColor: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () async {
              // var data = await fetchData(url);
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
            child: Text(
              'Fetch Predicted Future price Graph of ${widget.stock.company}',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.lightGreen,
                  backgroundColor: Colors.black),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
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
                      text: 'Closing Price of ${widget.stock.company}',
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
