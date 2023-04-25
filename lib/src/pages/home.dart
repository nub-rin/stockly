import 'package:flutter/material.dart';
import 'package:stockly/src/utils/authentication.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Logged in'),
          ElevatedButton(
            onPressed: () {
              Auth().signOut();
            },
            child: const Text('Sign Out'),
          ),
        ],
    )
    );
  }
}