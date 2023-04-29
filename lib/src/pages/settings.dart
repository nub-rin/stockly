import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './change_details.dart';
import '../utils/authentication.dart';
import '../utils/user_data.dart';

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
                        backgroundImage: NetworkImage(data['photoURL']),
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
                        data['phoneNumber'] == '' ? 'Not Set' : data['phoneNumber'],
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
                      onPressed: () {
                        Auth().signOut();
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
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            ),
            
      ),
    );
  }
}
