import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stockly/src/pages/home.dart';
import 'package:stockly/src/pages/login.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List onBoardingData = [
    {
      "image": 'lib/src/assets/images/screen1.png',
      "title": 'Care Your Family',
      "description": 'The process can include educating new'
    },
    {
      "image": 'lib/src/assets/images/screen2.png',
      "title": 'Act ahead of time',
      "description": 'No holding back'
    },
    {
      "image": 'lib/src/assets/images/screen3.png',
      "title": 'Go to Ahead!',
      "description": 'Explore the App...'
    },
  ];

  Color whiteColor = Colors.black;
  Color otherColor = Colors.white;

  PageController pageController = PageController();

  continueMethod() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  int currentPage = 0;

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: continueMethod,
            child: Text(
              'Skip',
              style: TextStyle(
                color: otherColor,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: onBoardingData.length,
            onPageChanged: onChanged,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    onBoardingData[index]['image'],
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       colorFilter: ColorFilter.mode(
                  //         Colors.black.withOpacity(0.35),
                  //         BlendMode.multiply,
                  //       ),
                  //       image: AssetImage(onBoardingData[index]['image']),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  Text(
                    onBoardingData[index]['title'],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: otherColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    onBoardingData[index]['description'],
                    style: TextStyle(
                      fontSize: 20,
                      color: otherColor,
                    ),
                  ),
                ],
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              (currentPage == (onBoardingData.length - 1))
                  ? ElevatedButton(
                      onPressed: continueMethod,
                      child: Text('Continue',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: whiteColor,
                          )),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(onBoardingData.length, (index) {
                          return AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 10,
                              width: (index == currentPage) ? 30 : 10,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (index == currentPage)
                                    ? Colors.white
                                    : otherColor.withOpacity(0.5),
                              ));
                        }),
                      ),
                    ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
