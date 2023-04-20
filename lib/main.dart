import 'package:flutter/material.dart';


void main() {
  runApp(const Stockly());
}

class Stockly extends StatelessWidget {
  const Stockly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stockly',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stockly'),
        ),
        body: const Center(
          child: Text('Stockly'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

