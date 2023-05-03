import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stockly/src/pages/welcome_screen.dart';

class ResultScreen extends StatelessWidget {
  final int userPercentage;
  final int totalRight;
  final int wrongQ;
  final int omittedQuestion;

  const ResultScreen(
      {super.key,
      required this.userPercentage,
      required this.totalRight,
      required this.wrongQ,
      required this.omittedQuestion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 10, left: 2),
          child: Text(
            'Your Results',
            // style: TextStyle(fontSize: 20.0),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: IconButton(
            // Add the back button icon
            icon: const Icon(Icons.arrow_back),
            iconSize: 30,
            onPressed: () {
              // Handle back button press event
              // Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
            },
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              userPercentage < 50
                  ? "Better Luck Next Time"
                  : userPercentage >= 50 && userPercentage <= 99
                      ? "You have Passed"
                      : "Perfect Score ",
              style: TextStyle(
                  fontFamily: 'TanseekModernProArabic',
                  fontSize: 22,
                  letterSpacing: 1,
                  color: userPercentage < 50 ? Colors.red : Colors.lightGreen,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 8.0,
                  animation: true,
                  percent: userPercentage / 100,
                  center: Text(
                    '  $userPercentage% ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'TanseekModernProArabic',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:
                          userPercentage < 60 ? Colors.red : Colors.lightGreen,
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor:
                      userPercentage < 60 ? Colors.red : Colors.lightGreen,
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Your Final Result is $userPercentage%',
              style: TextStyle(
                fontFamily: 'TanseekModernProArabic',
                fontSize: 22,
                color: userPercentage < 50 ? Colors.red : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Total Right Answers : $totalRight",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Total Wrong Answers : $wrongQ",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Total Skipped Questions : $omittedQuestion",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                    (Route<dynamic> route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text("Start Quiz Again"),
            )
          ],
        )
      ]),
    );
  }
}
