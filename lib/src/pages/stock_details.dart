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
import 'package:stockly/src/models/function.dart';

class StockPage extends StatefulWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  _StockPageState createState() => _StockPageState();
  // const StockPage({Key? key, required this.stock}) : super(key: key);
}

class _StockPageState extends State<StockPage> {
  String url = 'http://127.0.0.1:5000/stock/amzn';
  List<dynamic> decodedData = [];
  List<double> decodedData2 = [];
  List<String> dates = [];
  List<int> numbers = List.generate(1258, (index) => index);
  List<double> futurePredictions = [
    189.67654337882996,
    190.41853710152208,
    193.48391841240226,
    198.04887600578368,
    203.38168701194226,
    208.99664485771208,
    214.6280805170536,
    220.1567362111062,
    225.54369540810586,
    230.78591018877924,
    235.89158771075307,
    240.869046253711,
    245.7228894457221,
    250.45367289707065,
    255.0589836716652,
    259.53447213470935,
    263.8749949224293,
    268.0753927964717,
    272.131109752506,
    276.03847876265644,
    279.7951027654111,
    283.39990228936074,
    286.8531313277781,
    290.15640908777715,
    293.31245012246075,
    296.3249849580228,
    299.198569598794,
    301.9383156593889,
    304.54977924264966,
    307.0386751972139
  ];

  double output = 0.0;

  @override
  Widget build(BuildContext context) {
    // Create a list of dates starting from 2018-04-30
    DateTime startDate = DateTime(2018, 4, 30);
    for (int i = 0; i < 1288; i++) {
      dates.add(startDate.toString().substring(0, 10));
      startDate = startDate.add(Duration(days: 1));
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('StockPage'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                var data = await fetchData(url);
                setState(() {
                  decodedData = jsonDecode(data);
                  print(decodedData);
                  output = decodedData[3];
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
                'Fetch Previous closing price',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    backgroundColor: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width * 2,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: SfCartesianChart(
                    plotAreaBorderWidth:
                        0, // optional: remove the plot area border as well
                    // border: ChartBorder(
                    //   width: 1,
                    //   color: Colors.grey[300]!,
                    //   top: BorderSide(width: 0, color: Colors.transparent),
                    //   right: BorderSide(width: 0, color: Colors.transparent),
                    // ),
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
                      axisLine:
                          AxisLine(width: 1), // optional: remove axis line
                      majorTickLines: MajorTickLines(
                        color: Colors
                            .white, // Change the color of the x-axis tick lines
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    title: ChartTitle(
                        text: 'Closing Price of AAPLE',
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
                        // dataLabelSettings: DataLabelSettings(isVisible: true),
                        enableTooltip: true,
                        name: 'Actual Price',
                      ),
                      LineSeries<double, String>(
                        dataSource: futurePredictions,
                        xValueMapper: (double x, int index) =>
                            dates[index + decodedData2.length],
                        // index + decodedData2.length,
                        yValueMapper: (double y, _) => y,
                        // dataLabelSettings: DataLabelSettings(isVisible: true),
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
      ),
    );
  }
}
