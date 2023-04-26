import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stockly/src/utils/authentication.dart';

import '../utils/user_data.dart';
import '../widgets/home_fav_list.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
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
                  return Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(data['photoURL']),
                        radius: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Hello, ${data['name']}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.search),
                        color: Colors.white,
                        onPressed: () {
                          print("Search");
                        },
                      ),
                    ],
                  );
                }
                return const Text("Loading");
              },
            ),
          ),
          const HomeFavList(),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                Auth().signOut();
              },
              child: const Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(1, 30, 30, 30),
                onPrimary: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(1, 30, 30, 30),
    );
  }
}
