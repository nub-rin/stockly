import 'package:flutter/material.dart';
import 'package:stockly/src/pages/result_screen.dart';

const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List quizListData = [
    {
      "id": 1,
      "answer": "A market where stocks are bought and sold",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "What is a stock market?",
      "options": [
        {
          "option": "a",
          "value": "A market where houses are bought and sold",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "A market where stocks are bought and sold",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "A market where cars are bought and sold",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "A market where clothes are bought and sold",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 2,
      "answer": "A share of ownership in a company",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "What is a stock?",
      "options": [
        {
          "option": "a",
          "value": "A type of commodity",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "A type of bond",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "A share of ownership in a company",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "A type of currency",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 3,
      "answer": "A physical location where stocks are bought and sold",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "What is a stock exchange?",
      "options": [
        {
          "option": "a",
          "value": "A physical location where stocks are bought and sold",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "A virtual platform where stocks are bought and sold",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "A marketplace where cars are bought and sold",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "A marketplace where clothes are bought and sold",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 4,
      "answer": "The current market value of a single share of stock",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "What is a stock price?",
      "options": [
        {
          "option": "a",
          "value": "The total value of all the shares of a company",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "The current market value of a single share of stock",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "The profit made by a company in a year",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "The amount of money a company owes to its shareholders",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 5,
      "answer":
          "A stock in a well-established company with a long history of stability and growth",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "What is a blue-chip stock?",
      "options": [
        {
          "option": "a",
          "value":
              "A stock in a company that is currently facing financial difficulties",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value":
              "A stock in a small, start-up company with high potential for growth",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value":
              "A stock in a well-established company with a long history of stability and growth",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value":
              "A stock in a company that is expected to decline in the near future",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 6,
      "answer": "Apple Inc.",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "Which of the following is an example of a blue-chip stock?",
      "options": [
        {
          "option": "a",
          "value": "Tesla Inc.",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "GameStop Corp.",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "AMC Entertainment Holdings Inc.",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Apple Inc.",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 7,
      "answer": "Day trading",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "What is the name for the practice of buying and selling stocks frequently in order to make quick profits?",
      "options": [
        {
          "option": "a",
          "value": "Long-term investing",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Day trading",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Dollar-cost averaging",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Dividend investing",
          "color": "0xFFFFFFFF",
        }
      ],
    },
    {
      "id": 8,
      "answer": "Limit order",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "What is the name for an order to buy or sell a stock at a specific price?",
      "options": [
        {
          "option": "a",
          "value": "Market order",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "All of the above",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Stop order",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Limit order",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 9,
      "answer": "Return on equity (ROE)",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "Which of the following is a measure of a company's financial health and profitability?",
      "options": [
        {
          "option": "a",
          "value": "Return on equity (ROE)",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Dividend yield",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Market capitalization",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Price-to-earnings (P/E) ratio",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 10,
      "answer": "Standard & Poor's 500 (S&P 500)",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "What is the most common way to measure stock market performance?",
      "options": [
        {
          "option": "a",
          "value": "Gross Domestic Product (GDP)",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Consumer Price Index (CPI)",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Standard & Poor's 500 (S&P 500)",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Federal Funds Rate",
          "color": "0xFFFFFFFF",
        },
      ],
    },
  ];

  final _pageController = PageController(initialPage: 0);
  int questionIndex = 0;

  int userPercentage = 0;
  int wrongQ = 0;
  int ommitedQuestion = 0;
  int totalRight = 0;

  quizResult(context) {
    for (int i = 0; i < quizListData.length; i++) {
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 0) {
        ommitedQuestion++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 1) {
        totalRight++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 2) {
        wrongQ++;
      }
    }
    userPercentage = ((totalRight / quizListData.length) * 100).round();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            userPercentage: userPercentage,
            totalRight: totalRight,
            wrongQ: wrongQ,
            omittedQuestion: ommitedQuestion,
          ),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
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
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: TextButton(
              // onPressed: controller.nextQuestion,
              onPressed: () {
                if (questionIndex == quizListData.length - 1) {
                  quizResult(context);
                } else {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeIn);
                }
              },
              child: Text(
                questionIndex == quizListData.length - 1 ? "Submit" : "Skip",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text.rich(TextSpan(
                text: "Question ${questionIndex + 1}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Color(0xFF8B94BC)),
                children: [
                  TextSpan(
                      text: "/${quizListData.length}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Color(0xFF8B94BC)))
                ])),
          ),
          Expanded(
              child: PageView.builder(
            controller: _pageController,
            itemCount: quizListData.length,
            onPageChanged: (page) {
              // print("Current page $page");
              setState(
                () {
                  questionIndex = page;
                },
              );
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            quizListData[index]['title'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      quizListData[index]
                                  ['is_answer_status_right_wrong_omitted'] ==
                              2
                          ? Text(
                              "Sorry : Right answer is -> ${quizListData[index]['answer']} ",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 20,
                      ),
                      ...quizListData[index]['options']
                          .map(
                            (data) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(
                                          int.parse(
                                            data['color'],
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (quizListData[index]
                                                ['is_answered'] ==
                                            0) {
                                          setState(() {
                                            if (data['value'] ==
                                                quizListData[index]['answer']) {
                                              data['color'] = "0xFF31CD63";
                                              quizListData[index][
                                                  'is_answer_status_right_wrong_omitted'] = 1;
                                            } else {
                                              data['color'] = "0xFFFF0000";
                                              quizListData[index][
                                                  'is_answer_status_right_wrong_omitted'] = 2;
                                            }
                                            quizListData[index]['is_answered'] =
                                                1;
                                          });
                                        } else {}
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 0),
                                            child: Container(
                                              height: 40,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                color: Color(
                                                  int.parse(
                                                    data['color'],
                                                  ),
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  data['option'].toUpperCase(),
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              data['value'],
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: questionIndex == 0
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.spaceEvenly,
                            children: [
                              Visibility(
                                visible: questionIndex != 0,
                                child: IconButton(
                                  // Add the back button icon
                                  icon: const Icon(Icons.arrow_back),
                                  iconSize: 30,
                                  color: Colors.black,
                                  onPressed: () {
                                    _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                ),
                              ),
                              questionIndex == 0
                                  ? ElevatedButton(
                                      onPressed: () {
                                        _pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        elevation: 0,
                                        minimumSize: Size(100, 36),
                                      ),
                                      child: Text(
                                        "Next",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        if (questionIndex ==
                                            quizListData.length - 1) {
                                          quizResult(context);
                                        } else {
                                          _pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        elevation: 0,
                                      ),
                                      child: Text(
                                        questionIndex == quizListData.length - 1
                                            ? "Submit"
                                            : "Next",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
