import 'package:flutter/material.dart';
import 'package:stockly/src/utils/authentication.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: Auth().signOut(),
          child: const Text("Sign Out"),
        ),
      )
    );
  }
}