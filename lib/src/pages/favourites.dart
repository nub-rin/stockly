// Aryan Gandotra | Fav Page
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stockly/src/models/fav_list.dart';
import 'package:stockly/src/pages/news.dart';

import '../utils/user_data.dart';
import 'home.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key});

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: FutureBuilder<DocumentSnapshot>(
          future: UserData().getFavoriteList(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            if (snapshot.hasData && !snapshot.data!.exists) {
              UserData().createFavoriteList();
              return const Text("Document does not exist");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              List<dynamic> favList = data['favList'];
              if (favList.isEmpty) {
                return const Center(
                  child: Text(
                    'You have no favorites yet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                );
              }
              return FavList(favList: favList);
            }
            return const Text("loading");
          },
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
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[500],
          currentIndex: 1, // set the current index to the Favorites page
          onTap: (int index) {
            switch (index) {
              case 0:
                // Navigator.pushNamed(context, '/home');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
                break;
              case 1:
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
                Navigator.pushNamed(context, '/settings');
                break;
            }
          },
        ));
  }
}
