import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stockly/src/pages/news.dart';
import 'package:stockly/src/pages/welcome_screen.dart';

import '../models/stock.dart';
import '../utils/user_data.dart';
import '../widgets/home_trending_list.dart';
import '../widgets/stock_list.dart';
import 'favourites.dart';
import 'package:stockly/src/models/stock.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                            width: 50,
                            child: IconButton(
                              icon:
                                  Image.asset('lib/src/assets/images/logo.png'),
                              onPressed: () {
                                // Navigator.pushNamed(context, '/settings');
                              },
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 120, top: 10),
                            child: Text(
                              "Hello, ${data['name']}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/settings');
                          },
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(data['photoURL']),
                            radius: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Text("Loading");
              },
            ),
          ),
          const HomeTrendingList(),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: const SizedBox(
                      height: 30,
                      child: Text(
                        "Stocks",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<Stock>>(
                    future: Stock.getAll(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return StockList(stocks: snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('${snapshot.error}'),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
            icon: Icon(Icons.school),
            label: 'Learning',
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
              // Navigator.pushNamed(context, '/news');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewsPage(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
              // Navigator.pushNamed(context, '/learning');
              break;
            case 4:
              Navigator.pushNamed(context, '/settings');
              break;
          }
        },
      ),
    );
  }
}
