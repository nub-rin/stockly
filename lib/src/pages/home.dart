import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/stock.dart';
import '../utils/user_data.dart';
import '../widgets/home_trending_list.dart';
import '../widgets/stock_list.dart';
import 'favourites.dart';

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
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
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
          const HomeTrendingList(),
          const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height -
                350, // Set a fixed height for the container
            child: StockList(stocks: Stock.getAll()),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(1, 30, 30, 30),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
        currentIndex: 0, // set the current index to the Favorites page
        onTap: (int index) {
          switch (index) {
            case 0:
              // Navigator.pushNamed(context, '/');
              break;
            case 1:
              // Navigator.pushNamed(context, '/favorites');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Favorite(),
                ),
              );
              break; // do nothing as we're already on the Favorites page
            case 2:
              Navigator.pushNamed(context, '/news');
              break;
            case 3:
              Navigator.pushNamed(context, '/settings');
              break;
          }
        },
      ),
    );
  }
}
