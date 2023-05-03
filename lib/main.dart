import 'package:flutter/material.dart';
import 'package:stockly/src/pages/change_details.dart';
import 'package:stockly/src/pages/login.dart';
import 'package:stockly/src/pages/home.dart';
import 'package:stockly/src/pages/onBoarding.dart';
import 'package:stockly/src/pages/settings.dart';
import 'package:stockly/src/pages/signup.dart';
import 'package:stockly/src/utils/routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'src/utils/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Stockly());
}

class Stockly extends StatelessWidget {
  const Stockly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stockly',
      home: Auth().handleAuth(),
      routes: {
        StocklyRoutes.loginRoute: (context) => const Login(),
        StocklyRoutes.signupRoute: (context) => const Signup(),
        StocklyRoutes.homeRoute: (context) => const Home(),
        StocklyRoutes.settingsRoute: (context) => const Settings(),
        StocklyRoutes.changeDetailsRoute: (context) => const ChangeDetails(),
        StocklyRoutes.onboardingRoute: (context) => const OnBoardingScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
