import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/notification_service.dart';
import './change_details.dart';
import '../utils/authentication.dart';
import '../utils/user_data.dart';
import 'login.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<DocumentSnapshot>(
            future: UserData().getUserData(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              if (snapshot.hasData && !snapshot.data!.exists) {
                return const Text("Document does not exist");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: CircleAvatar(
                        radius: 50,
                        child: ClipOval(
                          child: Image.network(
                            data['photoURL'],
                            fit: BoxFit.cover, // or BoxFit.fill
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        data['name'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[600],
                    ),
                    ListTile(
                      title: const Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        data['phoneNumber'] == ''
                            ? 'Not Set'
                            : data['phoneNumber'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[600],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/changeDetails');
                      },
                      child: const ListTile(
                        title: Text(
                          'Change Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[600],
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () async {
                        await Auth().signOut();
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Login()), (Route<dynamic> route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Colors.red,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        NotificationService().sendNotification(
                            'Stockly - Stock Market, Made Easy', 'This is a test notification to show how the notification system works.');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Test Notification',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}

class LoginScreen {
}
