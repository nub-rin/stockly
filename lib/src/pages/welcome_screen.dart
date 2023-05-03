import 'package:flutter/material.dart';
import 'package:stockly/src/pages/home.dart';
import 'package:stockly/src/pages/quiz_screen.dart';

const kPrimaryGradient = LinearGradient(
  colors: [Color.fromARGB(255, 70, 117, 174), Color.fromARGB(255, 0, 115, 255)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 10, left: 2),
          child: Text(
            "Let's Start Learning",
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
                  builder: (context) => const Home(),
                ),
              );
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.asset(
                      "lib/src/assets/images/onboarding1.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  InkWell(
                    // onTap: () => Get.to(QuizScreen()),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Let's Start the Quiz",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
