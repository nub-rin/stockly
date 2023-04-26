import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/home_fav_model.dart';
import '../utils/user_data.dart';

class HomeFavList extends StatelessWidget {
  const HomeFavList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Your List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<DocumentSnapshot>(
          future: UserData().getFavoriteList(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            if (snapshot.hasData && !snapshot.data!.exists) {
              UserData().createFavoriteList();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              List<dynamic> favList = data['favList'];
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: favList.map((e) => HomeFavModel(
                    ticker: e,
                  )).toList(),
                ),
              );
            }
            return const Text("loading");
          },
        ),
      ],
    );
  }
}
